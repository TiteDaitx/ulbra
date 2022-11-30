public class Relogio {
    Ponteiro ponteiroHora = new Ponteiro();
    Ponteiro ponteiroMinuto = new Ponteiro();
    Ponteiro ponteiroSegundo = new Ponteiro();

    //acertar relogio a partir de uma hora, minuto e segundo
    public void acertarRelogio(int hora, int minuto, int segundo){
        //a linha abaixo calcula o modulo da hora.
        // Assim se for fornecido 13 por exemplo
        // é considerado o valor de 1;
        hora = hora % 12;

        //acerta a posição de cada um dos ponteiros
        //a divisnao por 5 dos minutos e segundos é necessaria para
        //converter o horário em posição
        //Exemplo 45 minutos representam a posição 9 do ponteiro do minutos
        ponteiroHora.posicao = hora;
        ponteiroMinuto.posicao = minuto / 5;
        ponteiroSegundo.posicao = segundo / 5;
    }
    public int lerHora(){
        return ponteiroHora.posicao;
    }
    public int lerMinuto(){
        return ponteiroMinuto.posicao * 5;
    }
    public int lerSegundo(){
        return  ponteiroSegundo.posicao * 5;
    }

}
