public class Trapezio {
    double altura;
    double baseMaior;
    double baseMenor;

    double calcularArea(){
        double area = ((baseMaior + baseMenor) / 2) * altura;
        return area;
    }
}
