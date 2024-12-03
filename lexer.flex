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
TURN_UP = "SUBIR"
TURN_DOWN = "BAJAR"
MOVE_TO = "MOVER_A"
ROTATE = "ROTAR"
STOP = "STOP"
STOP_IMMEDIATELY = "DETENER_INMEDIATAMENTE"
REVERSE = "INVERTIR"
WAIT = "ESPERAR"

INCREASE_SPEED = "AUMENTAR_VELOCIDAD"
DECREASE_SPEED = "DISMINUIR_VELOCIDAD"
SET_SPEED = "ESTABLECER_VELOCIDAD"

READ_SENSOR = "READ_SENSOR"
ACTIVATE_SENSOR = "ACTIVATE_SENSOR"
DEACTIVATE_SENSOR = "DEACTIVATE_SENSOR"

START = "START"
SHUTDOWN = "SHUTDOWN"
PAUSE = "PAUSE"
RESUME = "RESUME"
INIT = "INICIALIZAR"
RESET = "REINICIAR"
REBOOT = "REARRANCAR"
CALIBRATE = "CALIBRAR"
SHUT_OFF = "APAGAR_COMPLETAMENTE"

ACTIVATE_ALARM = "ACTIVAR_ALARMA"
DEACTIVATE_ALARM = "DESACTIVAR_ALARMA"
CHECK_BATTERY = "VERIFICAR_BATERIA"
CHARGE_BATTERY = "CARGAR_BATERIA"
LOW_BATTERY = "BATERIA_BAJA"

IF = "IF"
THEN = "THEN"
ELSE = "ELSE"
WHILE = "WHILE"
FOR = "FOR"
END = "END"
BREAK = "INTERRUMPIR"
CONTINUE = "CONTINUAR"

UPLOAD_FILE = "SUBIR_ARCHIVO"
DELETE_FILE = "ELIMINAR_ARCHIVO"
COPY_FILE = "COPIAR_ARCHIVO"
RENAME_FILE = "RENOMBRAR_ARCHIVO"
SAVE_FILE = "GUARDAR_ARCHIVO"

LOG = "REGISTRAR"
PRINT = "IMPRIMIR"
SCAN = "ESCANEAR"
UPLOAD = "SUBIR"
DOWNLOAD = "DESCARGAR"

TRUE = "VERDADERO"
FALSE = "FALSO"
NULL = "NULO"

OPEN_DOOR = "ABRIR_PUERTA"
CLOSE_DOOR = "CERRAR_PUERTA"
UNLOCK = "DESBLOQUEAR"
LOCK = "BLOQUEAR"
TOGGLE_LIGHT = "INTERRUMPIR_LUZ"

IDENTIFIER = [a-zA-Z_][a-zA-Z_0-9]*

DOUBLE_QUOTE = \"
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
    <YYINITIAL> {
    {MOVE_FORWARD}         { escribeToken(yytext(), "MOVE_FORWARD"); }
    {MOVE_BACKWARD}        { escribeToken(yytext(), "MOVE_BACKWARD"); }
    {TURN_LEFT}            { escribeToken(yytext(), "TURN_LEFT"); }
    {TURN_RIGHT}           { escribeToken(yytext(), "TURN_RIGHT"); }
    {TURN_UP}              { escribeToken(yytext(), "SUBIR"); }
    {TURN_DOWN}            { escribeToken(yytext(), "BAJAR"); }
    {MOVE_TO}              { escribeToken(yytext(), "MOVER_A"); }
    {ROTATE}               { escribeToken(yytext(), "ROTAR"); }
    {STOP}                 { escribeToken(yytext(), "PARAR"); }
    {STOP_IMMEDIATELY}     { escribeToken(yytext(), "DETENER_INMEDIATAMENTE"); }
    {REVERSE}              { escribeToken(yytext(), "INVERTIR"); }
    {WAIT}                 { escribeToken(yytext(), "ESPERAR"); }

    {INCREASE_SPEED}       { escribeToken(yytext(), "AUMENTAR_VELOCIDAD"); }
    {DECREASE_SPEED}       { escribeToken(yytext(), "DISMINUIR_VELOCIDAD"); }
    {SET_SPEED}            { escribeToken(yytext(), "ESTABLECER_VELOCIDAD"); }

    {READ_SENSOR}          { escribeToken(yytext(), "LEER_SENSOR"); }
    {ACTIVATE_SENSOR}      { escribeToken(yytext(), "ACTIVAR_SENSOR"); }
    {DEACTIVATE_SENSOR}    { escribeToken(yytext(), "DESACTIVAR_SENSOR"); }

    {START}                { escribeToken(yytext(), "INICIAR"); }
    {SHUTDOWN}             { escribeToken(yytext(), "SHUTDOWN"); }
    {PAUSE}                { escribeToken(yytext(), "PAUSA"); }
    {RESUME}               { escribeToken(yytext(), "RESUME"); }
    {INIT}                 { escribeToken(yytext(), "INICIALIZAR"); }
    {RESET}                { escribeToken(yytext(), "REINICIAR"); }
    {REBOOT}               { escribeToken(yytext(), "REARRANCAR"); }
    {CALIBRATE}            { escribeToken(yytext(), "CALIBRAR"); }
    {SHUT_OFF}             { escribeToken(yytext(), "APAGAR_COMPLETAMENTE"); }

    {ACTIVATE_ALARM}       { escribeToken(yytext(), "ACTIVAR_ALARMA"); }
    {DEACTIVATE_ALARM}     { escribeToken(yytext(), "DESACTIVAR_ALARMA"); }
    {CHECK_BATTERY}        { escribeToken(yytext(), "VERIFICAR_BATERIA"); }
    {CHARGE_BATTERY}       { escribeToken(yytext(), "CARGAR_BATERIA"); }
    {LOW_BATTERY}          { escribeToken(yytext(), "BATERIA_BAJA"); }

    {IF}                   { escribeToken(yytext(), "IF"); }
    {THEN}                 { escribeToken(yytext(), "THEN"); }
    {ELSE}                 { escribeToken(yytext(), "ELSE"); }
    {WHILE}                { escribeToken(yytext(), "WHILE"); }
    {FOR}                  { escribeToken(yytext(), "FOR"); }
    {END}                  { escribeToken(yytext(), "END"); }
    {BREAK}                { escribeToken(yytext(), "INTERRUMPIR"); }
    {CONTINUE}             { escribeToken(yytext(), "CONTINUAR"); }

    {UPLOAD_FILE}          { escribeToken(yytext(), "SUBIR_ARCHIVO"); }
    {DELETE_FILE}          { escribeToken(yytext(), "ELIMINAR_ARCHIVO"); }
    {COPY_FILE}            { escribeToken(yytext(), "COPIAR_ARCHIVO"); }
    {RENAME_FILE}          { escribeToken(yytext(), "RENOMBRAR_ARCHIVO"); }
    {SAVE_FILE}            { escribeToken(yytext(), "GUARDAR_ARCHIVO"); }

    {LOG}                  { escribeToken(yytext(), "REGISTRAR"); }
    {PRINT}                { escribeToken(yytext(), "IMPRIMIR"); }
    {SCAN}                 { escribeToken(yytext(), "ESCANEAR"); }
    {UPLOAD}               { escribeToken(yytext(), "SUBIR"); }
    {DOWNLOAD}             { escribeToken(yytext(), "DESCARGAR"); }

    {TRUE}                 { escribeToken(yytext(), "VERDADERO"); }
    {FALSE}                { escribeToken(yytext(), "FALSO"); }
    {NULL}                 { escribeToken(yytext(), "NULO"); }

    {OPEN_DOOR}            { escribeToken(yytext(), "ABRIR_PUERTA"); }
    {CLOSE_DOOR}           { escribeToken(yytext(), "CERRAR_PUERTA"); }
    {UNLOCK}               { escribeToken(yytext(), "DESBLOQUEAR"); }
    {LOCK}                 { escribeToken(yytext(), "BLOQUEAR"); }
    {TOGGLE_LIGHT}         { escribeToken(yytext(), "INTERRUMPIR_LUZ"); }

    {IDENTIFIER}           { escribeToken(yytext(), "IDENTIFICADOR"); }

    {DOUBLE_QUOTE}         { escribeToken(yytext(), "COMILLAS"); }
    {ASSIGN}               { escribeToken(yytext(), "ASIGNACION"); }
    {PLUS}                 { escribeToken(yytext(), "SUMA"); }
    {MINUS}                { escribeToken(yytext(), "RESTA"); }
    {MULTIPLY}             { escribeToken(yytext(), "MULTIPLICACION"); }
    {DIVIDE}               { escribeToken(yytext(), "DIVISION"); }

    {GREATER_THAN}         { escribeToken(yytext(), "MAYOR_QUE"); }
    {LESS_THAN}            { escribeToken(yytext(), "MENOR_QUE"); }
    {EQUALS}               { escribeToken(yytext(), "IGUAL_A"); }
    {NOT_EQUALS}           { escribeToken(yytext(), "NO_IGUAL"); }

    {AND}                  { escribeToken(yytext(), "Y_LOGICO"); }
    {OR}                   { escribeToken(yytext(), "O_LOGICO"); }

    {OPEN_PAREN}           { escribeToken(yytext(), "PARENTESIS_ABIERTO"); }
    {CLOSE_PAREN}          { escribeToken(yytext(), "PARENTESIS_CERRADO"); }
    {OPEN_BRACE}           { escribeToken(yytext(), "LLAVE_ABIERTA"); }
    {CLOSE_BRACE}          { escribeToken(yytext(), "LLAVE_CERRADA"); }

    {SEMICOLON}            { escribeToken(yytext(), "PUNTO_Y_COMA"); }
    {COLON}                { escribeToken(yytext(), "DOS_PUNTOS"); }
    {COMMA}                { escribeToken(yytext(), "COMA"); }

    {INTEGER}              { escribeToken(yytext(), "NUMERO_ENTERO"); }
    {FLOAT}                { escribeToken(yytext(), "NUMERO_FLOTANTE"); }

    {UNKNOWN_SYMBOL}       { System.err.println("Simbolo desconocido: " + yytext()); }

    \\s+                   { /* Ignorar espacios en blanco */ }
    .                      { System.err.println("Error: Token no reconocido: '" + yytext() + "'"); }
    }
}

