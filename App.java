import java.io.*;

public class App {
    public static void main(String[] args) {
        if (args.length < 2) {
            System.out.println("Uso: java App <archivo_entrada> <archivo_salida>");
            return;
        }

        String archivoEntrada = args[0];
        String archivoSalida = args[1];

        File inputFile = new File(archivoEntrada);
        if (!inputFile.exists() || !inputFile.isFile()) {
            System.err.println("Error: El archivo de entrada no existe: " + archivoEntrada);
            return;
        }

        System.out.println("Leyendo archivo de entrada: " + archivoEntrada);

        try (
            BufferedReader reader = new BufferedReader(new FileReader(archivoEntrada));
            BufferedWriter writer = new BufferedWriter(new FileWriter(archivoSalida))
        ) {
            Lexerclass lexer = new Lexerclass(reader, writer);

            System.out.println("Iniciando análisis léxico...");
            int tokenCount = 0;

            while (true) {
                System.out.println("Procesando siguiente token..."); // Depuración
                lexer.yylex(); // Invoca el lexer
                tokenCount++;

                if (lexer.isEOF()) {
                    System.out.println("Se alcanzó el final del archivo.");
                    break;
                }
            }

            System.out.println("Análisis completado. Tokens procesados: " + tokenCount);
            System.out.println("Tokens guardados en: " + archivoSalida);

            if (tokenCount == 0) {
                System.out.println("Advertencia: No se generaron tokens. Verifique el contenido de entrada.");
            }
        } catch (IOException e) {
            System.err.println("Error procesando los archivos:");
            e.printStackTrace();
        }
    }
}


/*public boolean isEOF() {
    return (zzLexicalState == YYEOF);


    public boolean isEOF() {
    return (zzAtEOF);
}


    {INVALID_IDENTIFIER}   { 
        System.err.println("Invalid identifier: " + yytext());
        return null; // Consume el token
    }

 */