public class relogio {

    ponteiro ponteiroHora = new ponteiro() ;
    ponteiro ponteiroMinuto =  new ponteiro();
    ponteiro ponteiroSegundo =  new ponteiro();

    public void acertarRelogio(int hora, int minuto, int segundo){//
        //a linha abaixo calcula o modilo da hora.
        //assim se for colocado valor 13 por exemplo
        // é considerado 1

        hora = hora % 12;

        //acerda a posição de cada um dos ponteiros
        //a divisão por 5 dos minutos e dos segundos e necessária para
        //acertar a hora com a posição
        //exemplo 45 min representa a posição 9 do ponteiro dos minutos

    ponteiroHora.posicao = hora;
    ponteiroMinuto.posicao= minuto/5;
    ponteiroSegundo. posicao = segundo/5;
    }
    public int lerHora(){

        return ponteiroHora.posicao;
    }
    public int lerMinuto(){
        return ponteiroMinuto.posicao*5;
    }
    public int lerSegundo(){
        return ponteiroSegundo.posicao*5;

    }

}
