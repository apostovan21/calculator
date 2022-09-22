#ifndef CALCULATORLOGIC_HPP
#define CALCULATORLOGIC_HPP

#include <QObject>
#include <QString>

class CalculatorLogic : public QObject
{
    Q_OBJECT

//    Q_PROPERTY( OperationType operation READ getOperationType WRITE setOperationType )
//    Q_PROPERTY( CalculatoryType type READ getCalcType WRITE setCalcType )


    // this should be the parent class
    // we need 2 child classes: dec + hex
public:
    CalculatorLogic();
    virtual ~CalculatorLogic( ) noexcept = default;

    enum OperationType { NoOperation, Addition, Substraction, Multiplication, Division};
    Q_ENUM( OperationType )

    enum CalculatoryType { Dec = 0, Hex = 1};
    Q_ENUM( CalculatoryType )

    OperationType getOperationType()const noexcept;
    void setOperationType(const OperationType& newType) noexcept;
    void setOperationType(const QString& newType) noexcept;

    CalculatoryType getCalcType()const noexcept;
    Q_INVOKABLE void setCalcType(const CalculatoryType& newType) noexcept;

    Q_INVOKABLE bool isDec() const noexcept;

    Q_INVOKABLE QString onKeyboardInput( const QString& value ) noexcept;
    Q_INVOKABLE QString onDigitInput( const QString& value ) noexcept;
    Q_INVOKABLE QString onLetterInput( const QString& value ) noexcept;
    Q_INVOKABLE QString onOperationInput( const QString& value ) noexcept;
    Q_INVOKABLE QString onDotInput( ) noexcept;
    Q_INVOKABLE QString onCleanInput( ) noexcept;
    Q_INVOKABLE QString onEnterEqualInput( ) noexcept;

private:
    OperationType operationType;
    CalculatoryType calculatorType;
    QString leftOperand;
    QString rightOperand;
    QString output;

    // methods

    bool isDigit(const QString& value) const noexcept;
    bool isALetterFormAToF(const QString& value) const noexcept;
    bool isValidOperation(const QString& value) const noexcept;
    void updateOutput() noexcept;
    void resetOutput() noexcept;
    void resetLeftOperator() noexcept;
    void resetRightOperator() noexcept;
    void resetOperationType() noexcept;
    void resetAll() noexcept;
    QString operationTypeToString() const noexcept;
    double doCalculationDec() const noexcept;
    QString doCalculationHex() const noexcept;
    bool isExpressionValid() const noexcept;

    void onOperationTypeChanged();
    //void onCalcTypeChanged();
};

#endif // CALCULATORLOGIC_HPP
