#include "calculatorlogic.h"

#include <iostream>

const QString DOT {"."};
//---------------------------------------------------------------------------//
CalculatorLogic::CalculatorLogic(QObject *parent):
    QObject(parent)
{
    // By default, QQuickItem does not draw anything. If you subclass
    // QQuickItem to create a visual item, you will need to uncomment the
    // following line and re-implement updatePaintNode()

    // setFlag(ItemHasContents, true);
}
//---------------------------------------------------------------------------//
CalculatorLogic::OperationType CalculatorLogic::getOperationType()const noexcept
{
    return operationType;
}
//---------------------------------------------------------------------------//
void CalculatorLogic::setOperationType(const OperationType& newType) noexcept
{
    operationType = newType;
    onOperationTypeChanged();
}
//---------------------------------------------------------------------------//
void CalculatorLogic::setOperationType(const QString& newType) noexcept
{
    if(newType == "+")
    {
        operationType = Addition;
    }
    else if(newType == "-")
    {
        operationType = Substraction;
    }
    else if(newType == "*")
    {
        operationType = Multiplication;
    }
    else if(newType == "/")
    {
        operationType = Division;
    }
    onOperationTypeChanged();
}
//---------------------------------------------------------------------------//
CalculatorLogic::CalculatoryType CalculatorLogic::getCalcType()const noexcept
{
    return calculatorType;
}
//---------------------------------------------------------------------------//
void CalculatorLogic::setCalcType(const CalculatoryType& newType) noexcept
{
    calculatorType = newType;
    resetAll();
}
//---------------------------------------------------------------------------//
QString CalculatorLogic::onKeyboardInput( const QString& value ) noexcept
{
    if( isValidOperation(value))
    {
        return onOperationInput(value);
    }

    if(isDigit(value))
    {
        return onDigitInput(value);
    }

    if(not isDec() and isALetterFormAToF(value))
    {
        return onLetterInput(value);
    }

    if(value == DOT)
    {
        return onDotInput();
    }

    return output; // other chars
}
//---------------------------------------------------------------------------//
QString CalculatorLogic::onDigitInput( const QString& value ) noexcept
{
    rightOperand += value;
    updateOutput();
    return output;
}
//---------------------------------------------------------------------------//
QString CalculatorLogic::onLetterInput( const QString& value ) noexcept
{
    rightOperand += value;
    updateOutput();
    return output;
}
//---------------------------------------------------------------------------//
QString CalculatorLogic::onOperationInput( const QString& value ) noexcept
{
    if(rightOperand.size() == 0)
    {
        return output;
    }
    setOperationType(value);
    updateOutput();
    return output;
}
//---------------------------------------------------------------------------//
QString CalculatorLogic::onDotInput() noexcept
{
    if(not isDec() or rightOperand.contains(DOT))
    {
        // DOt is not allowed for hexa operations
        return output;
    }

    if(rightOperand.size() == 0)
    {
        rightOperand = "0.";
    }
    else
    {
        rightOperand += DOT;
    }

    updateOutput();
    return output;
}
//---------------------------------------------------------------------------//
bool CalculatorLogic::isDigit(const QString& value) const noexcept
{
    if(value == "0" or value == "1" or value == "2" or
       value == "3" or value == "4" or value == "5" or
       value == "6" or value == "7" or value == "8" or value == "9" )
    {
        return true;
    }
    return false;
}
//---------------------------------------------------------------------------//
bool CalculatorLogic::isALetterFormAToF(const QString& value) const noexcept
{
    if(value == "A" or value == "B" or value == "C" or
       value == "D" or value == "E" or value == "F" )
    {
        return true;
    }
    return false;
}
//---------------------------------------------------------------------------//
bool CalculatorLogic::isValidOperation(const QString& value) const noexcept
{
    if(value == "+" or value == "-" or value == "*" or value == "/" )
    {
        return true;
    }
    return false;
}
//---------------------------------------------------------------------------//
void CalculatorLogic::updateOutput() noexcept
{
    resetOutput();
    if(leftOperand.size() > 0)
    {
        output += leftOperand;
    }
    output += operationTypeToString();
    if(rightOperand.size() > 0)
    {
        output += rightOperand;
    }
}
//---------------------------------------------------------------------------//
QString CalculatorLogic::onCleanInput() noexcept
{
    resetAll();
    return output;
}
//---------------------------------------------------------------------------//
QString CalculatorLogic::onEnterEqualInput() noexcept
{
    if(not isExpressionValid())
    {
        return output;
    }

    if(isDec())
    {
        double result = doCalculationDec();
        resetAll();
        rightOperand = QString::number(result);
        updateOutput();
    }
    else
    {
        QString result = doCalculationHex();
        resetAll();
        rightOperand = result;
        updateOutput();
    }
    return output;
}
//---------------------------------------------------------------------------//
void CalculatorLogic::resetOutput() noexcept
{
    output = "";
}
//---------------------------------------------------------------------------//
void CalculatorLogic::resetLeftOperator() noexcept
{
    leftOperand = "";
}
//---------------------------------------------------------------------------//
void CalculatorLogic::resetRightOperator() noexcept
{
    rightOperand = "";
}
//---------------------------------------------------------------------------//
void CalculatorLogic::resetOperationType() noexcept
{
    operationType = NoOperation;
}
//---------------------------------------------------------------------------//
void CalculatorLogic::resetAll() noexcept
{
    resetOutput();
    resetLeftOperator();
    resetRightOperator();
    resetOperationType();
}
//---------------------------------------------------------------------------//
QString CalculatorLogic::operationTypeToString() const noexcept
{
    switch (operationType) {
    case Addition:
        return "+";
        break;
    case Substraction:
        return "-";
        break;
    case Multiplication:
        return "*";
        break;
    case Division:
        return "/";
        break;
    default:
        return "";
        break;
    }
}
//---------------------------------------------------------------------------//
void CalculatorLogic::onOperationTypeChanged()
{
    leftOperand = rightOperand;
    resetRightOperator();
}
//---------------------------------------------------------------------------//
bool CalculatorLogic::isDec() const noexcept
{
    return calculatorType == Dec;
}
//---------------------------------------------------------------------------//
double CalculatorLogic::doCalculationDec() const noexcept
{
    double arg1 = leftOperand.toDouble();
    double arg2 = rightOperand.toDouble();

    switch (operationType)
    {
    case Addition:
        return arg1 + arg2;
        break;
    case Substraction:
        return arg1 - arg2;
        break;
    case Multiplication:
        return arg1 * arg2;
        break;
    case Division:
        return (arg2 == 0 ? 0: arg1 / arg2);
        break;
    default:
        return 0; // should never happen
        break;
    }
}
//---------------------------------------------------------------------------//
QString CalculatorLogic::doCalculationHex() const noexcept
{
    bool ok;

    int arg1 = leftOperand.toInt(&ok, 16);
    int arg2 = rightOperand.toInt(&ok, 16);

    if (not ok) {
        return output;
    }

    int result = 0;
    switch (operationType)
    {
    case Addition:
        result = arg1 + arg2;
        break;
    case Substraction:
        result = arg1 - arg2;
        break;
    case Multiplication:
        result = arg1 * arg2;
        break;
    case Division:
        result = arg1 / arg2;
        break;
    default:
        result = 0; // should never happen
        break;
    }

    QString hexadecimal;
    hexadecimal.setNum(result,16);
    return hexadecimal;
}
//---------------------------------------------------------------------------//
bool CalculatorLogic::isExpressionValid() const noexcept
{
    if (leftOperand.size() > 0 and rightOperand.size() > 0 and
            operationType not_eq NoOperation)
    {
        return true;
    }
    return false;
}
//---------------------------------------------------------------------------//

