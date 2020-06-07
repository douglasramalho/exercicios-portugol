/*
Algoritmo: Com base em uma frase digitado pelo usuário:

1) Converter a primeira letra de cada palavra para maiúscula e exibir o resultado
2) Exibir a quantidade de vogais, consoantes e números presentes na frase
3) Exibir a maior palavra da frase
4) Exibir as palavras de tamanho par
5) Identificar se a frase é um palindromo (lida de trás pra frente mantendo o significado original)
*/

programa
{
	inclua biblioteca Texto
	inclua biblioteca Tipos
	
	cadeia frase
	cadeia palavras[20]
	inteiro numero_de_caracteres = 0
	inteiro quantidade_palavras = 0
	
	funcao inicio()
	{
		escreva("Digite uma frase: ")
		leia(frase)
		numero_de_caracteres = Texto.numero_caracteres(frase)

		converter_frase_em_palavras()

		escreva("1) ")
		para(inteiro i = 0; i < quantidade_palavras; i++) {
			escreva(primeira_letra_em_maiuscula(palavras[i]), " ")
		}

		escreva("\n2) ", quantidade_vogais(), " vogais, ", quantidade_consoantes(), " consoantes, ", quantidade_numeros(), " números")

		escreva("\n3) ", maior_palavra())

		escreva("\n4) ", palavras_tamanho_par())

		
		escreva("\n5) ", ehPalindromo())
	}

	funcao vazio converter_frase_em_palavras() {
		
		inteiro posicao_inicial_palavra = 0
		inteiro indice_palavra = 0

		para(inteiro i = 0; i < numero_de_caracteres; i++) {
			se(Texto.obter_caracter(frase, i) == ' ') {
				palavras[indice_palavra] = Texto.extrair_subtexto(frase, posicao_inicial_palavra, i)
				posicao_inicial_palavra = i + 1

				indice_palavra++ // indice_palavra = indice_palavra + 1
				quantidade_palavras++
			} senao se(i == numero_de_caracteres - 1) {
				palavras[indice_palavra] = Texto.extrair_subtexto(frase, posicao_inicial_palavra, i + 1)
				quantidade_palavras++
			}
		}
	}

	funcao cadeia primeira_letra_em_maiuscula(cadeia palavra) {
		se(Texto.numero_caracteres(palavra) > 1) {
			caracter primeira_letra = Texto.obter_caracter(palavra, 0)
			cadeia primeira_letra_alta = Texto.caixa_alta(Tipos.caracter_para_cadeia(primeira_letra))

			retorne primeira_letra_alta + Texto.extrair_subtexto(palavra, 1, Texto.numero_caracteres(palavra))
		}

		retorne palavra
	}

	funcao inteiro quantidade_vogais() {
		inteiro qtd_vogais = 0
		para(inteiro i = 0; i < numero_de_caracteres; i++) {
			caracter caractere = Texto.obter_caracter(frase, i)
			se(caractere == 'a' ou caractere == 'e' ou caractere == 'i' ou caractere == 'o' ou caractere == 'u') {
				qtd_vogais++
			}
		}

		retorne qtd_vogais
	}

	funcao inteiro quantidade_consoantes() {
		inteiro qtd_consoantes = 0
		para(inteiro i = 0; i < numero_de_caracteres; i++) {
			caracter caractere = Texto.obter_caracter(frase, i)
			se(caractere != ' ' e nao Tipos.caracter_e_inteiro(caractere) e caractere != 'a' e caractere != 'e' e caractere != 'i' e caractere != 'o' e caractere != 'u') {
				qtd_consoantes++
			}
		}

		retorne qtd_consoantes
	}

	funcao inteiro quantidade_numeros() {
		inteiro qtd_numeros = 0
		para(inteiro i = 0; i < numero_de_caracteres; i++) {
			caracter caractere = Texto.obter_caracter(frase, i)
			se(Tipos.caracter_e_inteiro(caractere)) {
				qtd_numeros++
			}
		}

		retorne qtd_numeros
	}

	funcao cadeia maior_palavra() {
		cadeia guarda_maior = ""
		para(inteiro i = 0; i < quantidade_palavras; i++) {
			cadeia palavra_atual = palavras[i]
			se(Texto.numero_caracteres(palavra_atual) > Texto.numero_caracteres(guarda_maior)) {
				guarda_maior = palavra_atual
			}
		}

		retorne guarda_maior
	}

	funcao cadeia palavras_tamanho_par() {
		cadeia palavras_pares = ""
		para(inteiro i = 0; i < quantidade_palavras; i++) {
			cadeia palavra_atual = palavras[i]
			se(Texto.numero_caracteres(palavra_atual) % 2 == 0) {
				se(i > 0) {
					palavras_pares += " "
				}
				
				palavras_pares += palavra_atual
			}
		}

		retorne palavras_pares
	}

	funcao cadeia ehPalindromo() {
		cadeia frase_limpa = ""
		cadeia frase_invertida = ""

		para(inteiro i = 0; i < quantidade_palavras; i++) {
			frase_limpa += palavras[i]
		}

		para(inteiro i = Texto.numero_caracteres(frase_limpa) - 1; i >= 0; i--) {
			frase_invertida += Texto.obter_caracter(Texto.caixa_baixa(frase_limpa), i)
		}

		se(frase_invertida == frase_limpa) {
			retorne "Sim, é um palindromo"
		}

		retorne "Não é um palindromo"
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3408; 
 * @DOBRAMENTO-CODIGO = [33, 52, 63, 75, 87, 99, 111];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
