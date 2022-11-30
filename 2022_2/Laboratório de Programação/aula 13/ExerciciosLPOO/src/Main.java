public class Main {
    public static void main(String[] args) {
        //Criar um tringulo dar valor aos atributos e calcular sua área
        Triangulo tr = new Triangulo();
        tr.base = 2.5;
        tr.altura = 4;
        double area = tr.calcularArea();
        System.out.println("A área do triangulo é: " + area);
        //Criar um quadrado dar valor aos seus atributos e calcular a sua área
        Quadrado q = new Quadrado();
        q.lado = 3.2;
        area = q.calcularArea();
        System.out.println("A área do quadrado é: " + area);
        //Criar um circunferencia dar valor aos seus atributos e calcular a sua área
        Circunferencia c = new Circunferencia();
        c.raio = 5;
        area = c.calcularArea();
        System.out.println("A área da circunferencia é: " + area);
        //Criar um trapezio dar valor aos seus atributos e calcular a sua área
        Trapezio t = new Trapezio();
        t.baseMaior = 7.1;
        t.baseMenor = 3.6;
        t.altura = 2;
        area = t.calcularArea();
        System.out.println("A área do trapézio é: " + area);
    }
}