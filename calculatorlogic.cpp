#include "calculatorlogic.hpp"

CalculatorLogic::CalculatorLogic()
{

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
        operationType = addition;
    }
    else if(newType == "-")
    {
        operationType = substraction;
    }
    else if(newType == "*")
    {
        operationType = multiplication;
    }
    else if(newType == "/")
    {
        operationType = division;
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
}
//---------------------------------------------------------------------------//
QString CalculatorLogic::onKeyboardInput( const QString& value ) noexcept
{
    if(rightOperand.size() > 0 and isValidOperation(value))
    {
        return onOperationInput(value);
    }

    if(isDigit(value))
    {
        return onDigitInput(value);
    }

    if(calculatorType == CalculatorLogic::CalculatoryType::hex and
            isALetterFormAToF(value))
    {
        rightOperand += value;
        updateOutput();
    }

    return output;
}
//---------------------------------------------------------------------------//
QString CalculatorLogic::onDigitInput( const QString& value ) noexcept
{
    rightOperand += value;
    updateOutput();
    return output;
}
//---------------------------------------------------------------------------//
QString CalculatorLogic::onOperationInput( const QString& value ) noexcept
{
    setOperationType(value);
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
    operationType = noOperation;
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
    case addition:
        return "+";
        break;
    case substraction:
        return "-";
        break;
    case multiplication:
        return "*";
        break;
    case division:
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
    rightOperand = "";
}
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
