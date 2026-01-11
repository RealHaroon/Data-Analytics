import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class ScientificCalculator extends JFrame implements ActionListener {
    
    private JTextField display;
    private JLabel expressionLabel;
    private String currentInput = "";
    private String operator = "";
    private double firstNumber = 0;
    private boolean startNewNumber = true;
    
    public ScientificCalculator() {
        setTitle("Scientific Calculator");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(400, 600);
        setLayout(new BorderLayout(5, 5));
        getContentPane().setBackground(new Color(240, 240, 240));
        
        // Display Panel
        JPanel displayPanel = new JPanel();
        displayPanel.setLayout(new BorderLayout());
        displayPanel.setBackground(Color.WHITE);
        displayPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        
        expressionLabel = new JLabel(" ");
        expressionLabel.setFont(new Font("Arial", Font.PLAIN, 14));
        expressionLabel.setForeground(Color.GRAY);
        displayPanel.add(expressionLabel, BorderLayout.NORTH);
        
        display = new JTextField("0");
        display.setFont(new Font("Arial", Font.BOLD, 28));
        display.setEditable(false);
        display.setHorizontalAlignment(JTextField.RIGHT);
        display.setBorder(BorderFactory.createEmptyBorder(5, 5, 5, 5));
        displayPanel.add(display, BorderLayout.CENTER);
        
        add(displayPanel, BorderLayout.NORTH);
        
        // Button Panel
        JPanel buttonPanel = new JPanel();
        buttonPanel.setLayout(new GridLayout(6, 5, 5, 5));
        buttonPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        
        String[] buttons = {
            "sin", "cos", "tan", "log", "ln",
            "x²", "x³", "√", "1/x", "π",
            "7", "8", "9", "÷", "C",
            "4", "5", "6", "×", "←",
            "1", "2", "3", "-", "(",
            "0", ".", "=", "+", ")"
        };
        
        for (String text : buttons) {
            JButton button = new JButton(text);
            button.setFont(new Font("Arial", Font.BOLD, 16));
            button.setFocusPainted(false);
            button.addActionListener(this);
            
            // Color coding
            if (text.matches("[0-9]") || text.equals(".")) {
                button.setBackground(Color.WHITE);
            } else if (text.equals("=")) {
                button.setBackground(new Color(76, 175, 80));
                button.setForeground(Color.WHITE);
            } else if (text.equals("C") || text.equals("←")) {
                button.setBackground(new Color(244, 67, 54));
                button.setForeground(Color.WHITE);
            } else {
                button.setBackground(new Color(240, 240, 240));
            }
            
            buttonPanel.add(button);
        }
        
        add(buttonPanel, BorderLayout.CENTER);
        
        setLocationRelativeTo(null);
        setVisible(true);
    }
    
    @Override
    public void actionPerformed(ActionEvent e) {
        String command = e.getActionCommand();
        
        try {
            if (command.matches("[0-9]")) {
                handleNumber(command);
            } else if (command.equals(".")) {
                handleDecimal();
            } else if (command.equals("C")) {
                clear();
            } else if (command.equals("←")) {
                backspace();
            } else if (command.equals("=")) {
                calculate();
            } else if (command.equals("+") || command.equals("-") || 
                       command.equals("×") || command.equals("÷")) {
                handleBasicOperator(command);
            } else {
                handleScientificFunction(command);
            }
        } catch (Exception ex) {
            display.setText("Error");
            startNewNumber = true;
        }
    }
    
    private void handleNumber(String num) {
        if (startNewNumber) {
            display.setText(num);
            startNewNumber = false;
        } else {
            display.setText(display.getText() + num);
        }
    }
    
    private void handleDecimal() {
        if (startNewNumber) {
            display.setText("0.");
            startNewNumber = false;
        } else if (!display.getText().contains(".")) {
            display.setText(display.getText() + ".");
        }
    }
    
    private void clear() {
        display.setText("0");
        expressionLabel.setText(" ");
        currentInput = "";
        operator = "";
        firstNumber = 0;
        startNewNumber = true;
    }
    
    private void backspace() {
        String text = display.getText();
        if (text.length() > 1) {
            display.setText(text.substring(0, text.length() - 1));
        } else {
            display.setText("0");
            startNewNumber = true;
        }
    }
    
    private void handleBasicOperator(String op) {
        firstNumber = Double.parseDouble(display.getText());
        operator = op;
        expressionLabel.setText(firstNumber + " " + op);
        startNewNumber = true;
    }
    
    private void calculate() {
        if (operator.isEmpty()) return;
        
        double secondNumber = Double.parseDouble(display.getText());
        double result = 0;
        
        switch (operator) {
            case "+":
                result = firstNumber + secondNumber;
                break;
            case "-":
                result = firstNumber - secondNumber;
                break;
            case "×":
                result = firstNumber * secondNumber;
                break;
            case "÷":
                result = firstNumber / secondNumber;
                break;
        }
        
        display.setText(formatResult(result));
        expressionLabel.setText(firstNumber + " " + operator + " " + secondNumber + " =");
        operator = "";
        startNewNumber = true;
    }
    
    private void handleScientificFunction(String function) {
        double value = Double.parseDouble(display.getText());
        double result = 0;
        
        switch (function) {
            case "sin":
                result = Math.sin(Math.toRadians(value));
                break;
            case "cos":
                result = Math.cos(Math.toRadians(value));
                break;
            case "tan":
                result = Math.tan(Math.toRadians(value));
                break;
            case "log":
                result = Math.log10(value);
                break;
            case "ln":
                result = Math.log(value);
                break;
            case "√":
                result = Math.sqrt(value);
                break;
            case "x²":
                result = Math.pow(value, 2);
                break;
            case "x³":
                result = Math.pow(value, 3);
                break;
            case "1/x":
                result = 1 / value;
                break;
            case "π":
                result = Math.PI;
                break;
            case "(":
            case ")":
                return;
        }
        
        display.setText(formatResult(result));
        expressionLabel.setText(function + "(" + value + ")");
        startNewNumber = true;
    }
    
    private String formatResult(double result) {
        if (result == (long) result) {
            return String.format("%d", (long) result);
        } else {
            return String.format("%.8f", result).replaceAll("0*$", "").replaceAll("\\.$", "");
        }
    }
    
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new ScientificCalculator());
    }
}
