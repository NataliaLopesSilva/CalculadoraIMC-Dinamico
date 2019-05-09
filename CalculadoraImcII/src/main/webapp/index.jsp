<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Calculadora de IMC</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<!--Código necessário para que a página suporte caracteres especiais-->
<%@ page contentType="text/html; charset=UTF-8" %>

<body style="background-image: url(img/fundo.jpg);">
    <br>
    <div class="container">
        <div class="card">
            <div class="card-header" style="font-size: 22px; text-align: center; font-weight: bold; color:#44914a">
                Calcule seu IMC
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-12">
                                <h6 style="color: #646464">IMC é a sigla para Índice de Massa Corpórea, parâmetro
                                    adotado pela Organização Mundial de Saúde para calcular o peso ideal de cada pessoa.
                                    Vamos calcular seu IMC?
                                </h6>
                            </div>
                        </div>
                        <br>

                        <form>
                            <fieldset>
                                <div class="form-row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>Digite sua altura (em metros):</label>
                                            <input id="altura" name="altura" class="form-control" type="text"
                                                placeholder="Ex: 1.70" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>Digite seu peso (em Kg):</label>
                                            <input id="peso" name="peso" class="form-control" placeholder="Ex: 70.300"
                                                type="text" required>
                                        </div>
                                    </div>
                                </div>

                                <br>
                                <button class="btn btn-success" type="submit">Calcular</button>
                                <a class="btn btn-outline-success" href=".">Limpar</a>
                            </fieldset>
                        </form>
                    </div>

                    <!-- <div class="linha-vertical"></div> -->

                    <div class="col-md-6 linha-vertical">
                        <div class="row">
                            <div class="col-md-12" style="text-align:center">
                                <!-- Scriptlet. Codigo Java no HTML. -->
                                <%
                                    //Pega os parâmetros do submit
                                    String alturaParam = request.getParameter("altura");
                                    String pesoParam = request.getParameter("peso");
                                    double imc = 0;

                                    //Calcula o imc
                                    if(alturaParam != null && pesoParam != null) {
                                        double altura = Double.parseDouble(alturaParam);
                                        double peso = Double.parseDouble(pesoParam);
                                        imc = (peso/(altura * altura));
                                    }
                                %>
                                <br>
                                <% if(imc == 0){ %>
                                <img src="img/balanca.jpg" class="rounded-circle" style="width:100%">
                                <% }
                                   else { 
                                       if(imc < 18.5) {
                                %>

                                <h3 style="color:#d80702">Seu IMC é <%= String.format("%.2f", imc)%> </h3>
                                <br>
                                <p style="color:#d80702">
                                    <strong>Você pode estar abaixo do peso!</strong> Essa é uma condição em que a pessoa pesa
                                    menos do que é considerado
                                    adequado para aquela altura, idade e sexo. Uma pessoa nestas condições pode estar
                                    com alguma doença que a está emagrecendo ou sua nutrição não está boa o suficiente.
                                    Normalmente estas pessoas podem ter deficiências de nutrientes como vitaminas, sais
                                    minerais, proteínas, gorduras ou sob o risco de estar com anorexia. Para maiores
                                    esclarecimentos você deve procurar ajuda médica...
                                </p>
                                <%      }
                                        else if(imc >= 18.5 && imc <= 24.9) {
                                %>

                                <h3 style="color:#28a745">Seu IMC é <%= String.format("%.2f", imc)%> </h3>
                                <br>
                                <p style="color:#28a745">
                                    <strong>Seu peso está normal!</strong> Estar dentro da faixa de peso ideal
                                    significa ter um peso considerado adequado para sua altura, idade e sexo, de acordo
                                    com as faixas do IMC. Para manter o peso é importante manter uma dieta balanceada
                                    (não basta alimentos corretos, mas também quantidades corretas) para seu organismo.
                                    Devem ser avaliados peso, idade, composição corporal, presença de doenças e/ou
                                    comorbidades.
                                </p>

                                <%      }
                                        else if(imc >= 25 && imc <= 29.9) {
                                %>

                                <h3 style="color:#d80702">Seu IMC é <%= String.format("%.2f", imc)%> </h3>
                                <br>
                                <p style="color:#d80702">
                                    <strong>Você pode estar com sobrepeso!</strong> Essa é uma condição em que a pessoa
                                    pesa mais do que é considerado adequado para aquela altura, idade e sexo. O
                                    sedentarismo e os maus hábitos alimentares levam ao aumento dessa parcela de
                                    indivíduos com sobrepeso a cada ano. Essa faixa, se analisada junto com outras
                                    medidas e índices, pode demonstrar um risco maior de doenças como diabetes tipo 2,
                                    dislipidemia (com colesterol HDL baixo e triglicérides altos), ácido úrico
                                    aumentado, hipertensão, entre outras.. Para maiores
                                    esclarecimentos você deve procurar ajuda médica...
                                </p>

                                <%      }
                                        else if(imc >= 30) {
                                %>

                                <h3 style="color:#d80702">Seu IMC é <%= String.format("%.2f", imc)%> </h3>
                                <br>
                                <p style="color:#d80702">
                                    <strong>Você pode estar com Obesidade!</strong> Existem as obesidades grau 1,
                                    2, e 3, mas somente o cálculo do IMC não é suficiente para diagnosticar obesidade.
                                    Na verdade, para além do IMC, são necessárias as seguintes medidas antropométricas:
                                    peso, estatura, espessura da dobra cutânea (bíceps, tríceps, subescapular e suprailíaca).
                                    Depois, é encontrado o percentual de gordura, que se for maior do que 25% a 30%, já é
                                    considerado um nível de obesidade. O índice de massa corporal tem que estar maior que 30kg/m².
                                    Para maiores esclarecimentos você deve procurar ajuda médica...
                                </p>
                                <%
                                        }
                                    }
                                %>
                                <p>

                                </p>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .linha-vertical {
            border-left: 1px solid;
            border-color: #8080809a;
            /* Adiciona borda esquerda na div como ser fosse uma linha.*/
            box-sizing: border-box;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>

</html>