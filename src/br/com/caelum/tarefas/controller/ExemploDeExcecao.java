package br.com.caelum.tarefas.controller;

public class ExemploDeExcecao {

	public static void main(String[] args) {

		int var = 4;

		try {

			Integer i = new Integer(var);

			System.out.println("A vari�vel i vale " + i);

		} catch (NumberFormatException nfe) {

			System.out.println("N�o � poss�vel atribuir a string " + var

			+ " a um Objeto Inteiro.\n"

			+ "A seguinte mensagem foi retornada:\n\n"

			+ nfe.getMessage());

		}

	}

}
