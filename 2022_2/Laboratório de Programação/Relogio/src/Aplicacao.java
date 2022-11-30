public class Aplicacao {
    public static void main(String[] args) {
        //cria objeto relogio
        Relogio r1 = new  Relogio();

        //acertar o relogio
        r1.acertarRelogio(3, 30, 50);

        //mostrar as posições dos ponteiros do relógio
        System.out.println("Posição da hora " + r1.ponteiroHora.posicao);
        System.out.println("Posição do minuto " + r1.ponteiroMinuto.posicao);
        System.out.println("Posição do segundo " + r1.ponteiroSegundo.posicao);

        //mostrar a hora o minuto e o segundo
        int hora = r1.lerHora();
        int minuto = r1.lerMinuto();
        int segundo = r1.lerSegundo();

        System.out.println("Hora: " + hora);
        System.out.println("Minuto: " + minuto);
        System.out.println("Segundo: " + segundo);

        Relogio r2 = new Relogio();

        r2.acertarRelogio(22, 0, 0);

        System.out.println("Valor da hora" + r2.lerHora());

    }
}
