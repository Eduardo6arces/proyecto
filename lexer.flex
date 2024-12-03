import java.io.BufferedWriter; 
import java.io.File;
import java.io.FileWriter; 
import java.io.IOException;
import java.io.Reader; 
%%
%public
%class Lexerclass
%unicode
%standalone

%{
private BufferedWriter writer;



    public boolean isEOF() {
    return (zzAtEOF);
}

public Lexerclass (Reader in, BufferedWriter writer) {
this.zzReader = in;
this.writer = writer;
}

private void escribeToken(String lexema, String token) {
try {
writer.write(lexema + " - " + token + "\n");
} catch (IOException e) { 
e.printStackTrace();
}
}
%}

MOVE_FORWARD = "MOVE_FORWARD"
MOVE_BACKWARD = "MOVE_BACKWARD"
TURN_LEFT = "TURN_LEFT"
TURN_RIGHT = "TURN_RIGHT"
STOP = "STOP"

READ_SENSOR = "READ_SENSOR"
ACTIVATE_SENSOR = "ACTIVATE_SENSOR"
DEACTIVATE_SENSOR = "DEACTIVATE_SENSOR"

START = "START"
SHUTDOWN = "SHUTDOWN"
PAUSE = "PAUSE"
RESUME = "RESUME"

IF = "IF"
THEN = "THEN"
ELSE = "ELSE"
WHILE = "WHILE"
FOR = "FOR"
END = "END"

IDENTIFIER = [a-zA-Z_][a-zA-Z_0-9]*

ASSIGN = "="
PLUS = "\+"
MINUS = "-"
MULTIPLY = "\*"
DIVIDE = "/"
GREATER_THAN = ">"
LESS_THAN = "<"
EQUALS = "=="
NOT_EQUALS = "!="
AND = "AND"
OR = "OR"

OPEN_PAREN = "\("
CLOSE_PAREN = "\)"
OPEN_BRACE = "\{"
CLOSE_BRACE = "\}"
SEMICOLON = ";"
COLON = ":"
COMMA = ","

INTEGER = [0-9]+
FLOAT = [0-9]+\.[0-9]+


UNKNOWN_SYMBOL = .

%%

<YYINITIAL> {
        {MOVE_FORWARD}         { escribeToken(yytext(), "AVANZAR"); }
    {MOVE_BACKWARD}        { escribeToken(yytext(), "RETROCEDER"); }
    {TURN_LEFT}            { escribeToken(yytext(), "GIRAR_IZQUIERDA"); }
    {TURN_RIGHT}           { escribeToken(yytext(), "GIRAR_DERECHA"); }
    {STOP}                 { escribeToken(yytext(), "DETENER"); }

    {READ_SENSOR}          { escribeToken(yytext(), "LEER_SENSOR"); }
    {ACTIVATE_SENSOR}      { escribeToken(yytext(), "ACTIVAR_SENSOR"); }
    {DEACTIVATE_SENSOR}    { escribeToken(yytext(), "DESACTIVAR_SENSOR"); }

    {START}                { escribeToken(yytext(), "INICIAR"); }
    {SHUTDOWN}             { escribeToken(yytext(), "APAGAR"); }
    {PAUSE}                { escribeToken(yytext(), "PAUSA"); }
    {RESUME}               { escribeToken(yytext(), "REANUDAR"); }

    {IF}                   { escribeToken(yytext(), "SI"); }
    {ELSE}                 { escribeToken(yytext(), "SINO"); }
    {THEN}                 { escribeToken(yytext(), "ENTONCES"); }
    {WHILE}                { escribeToken(yytext(), "MIENTRAS"); }
    {FOR}                  { escribeToken(yytext(), "PARA"); }
    {END}                  { escribeToken(yytext(), "FIN"); }

    {IDENTIFIER}           { escribeToken(yytext(), "IDENTIFICADOR"); }
    {ASSIGN}               { escribeToken(yytext(), "ASIGNAR"); }
    {PLUS}                 { escribeToken(yytext(), "SUMAR"); }
    {MINUS}                { escribeToken(yytext(), "RESTAR"); }
    {MULTIPLY}             { escribeToken(yytext(), "MULTIPLICAR"); }
    {DIVIDE}               { escribeToken(yytext(), "DIVIDIR"); }
    {GREATER_THAN}         { escribeToken(yytext(), "MAYOR_QUE"); }
    {LESS_THAN}            { escribeToken(yytext(), "MENOR_QUE"); }
    {EQUALS}               { escribeToken(yytext(), "IGUAL_A"); }
    {NOT_EQUALS}           { escribeToken(yytext(), "NO_IGUAL"); }
    {AND}                  { escribeToken(yytext(), "Y"); }
    {OR}                   { escribeToken(yytext(), "O"); }

    {OPEN_PAREN}           { escribeToken(yytext(), "PARENTESIS_ABIERTO"); }
    {CLOSE_PAREN}          { escribeToken(yytext(), "PARENTESIS_CERRADO"); }
    {OPEN_BRACE}           { escribeToken(yytext(), "LLAVE_ABIERTA"); }
    {CLOSE_BRACE}          { escribeToken(yytext(), "LLAVE_CERRADA"); }
    {SEMICOLON}            { escribeToken(yytext(), "PUNTO_Y_COMA"); }
    {COLON}                { escribeToken(yytext(), "DOS_PUNTOS"); }
    {COMMA}                { escribeToken(yytext(), "COMA"); }

    {INTEGER}              { escribeToken(yytext(), "NUMERO_ENTERO"); }
    {FLOAT}                { escribeToken(yytext(), "FLOTANTE"); }

    {UNKNOWN_SYMBOL}       { System.err.println("Unknown symbol: " + yytext()); }
    \\s+                   { /* Ignorar espacios en blanco */ }
    .                      { System.err.println("Carácter no reconocido: " + yytext()); }
}