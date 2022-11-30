public class testeRelogio {
    public static void main(String[] args) {
        relogio r1 = new relogio();

        //acertar o relogio
        r1.acertarRelogio(3, 30, 50);

        // mostrar posiçoes dos ponteiros
        System.out.println("posição do ponteiro da hora "+ r1.ponteiroHora.posicao);
        System.out.println("posição do ponteiro do minuto "+ r1.ponteiroSegundo.posicao);
        System.out.println("posição do ponteiro do segundo "+ r1.ponteiroMinuto.posicao);

        int hora = r1.lerHora();
        int minuto = r1.lerMinuto();
        int segundo = r1.lerSegundo();


        System.out.println("hora; "+ hora);
        System.out.println("segundo; "+ minuto);
        System.out.println("minuto; "+ segundo);

        relogio r2 = new relogio();
        r2.acertarRelogio(22,0,0);

        System.out.println("hora; "+ hora);
        System.out.println("segundo; "+ minuto);
        System.out.println("minuto; "+ segundo);

        System.out.println("Valor da hora" + r2.lerHora());
    }
}

