package br.com.caelum.tarefas.controller;

public class ExemploDeExcecao {

	public static void main(String[] args) {

		int var = 4;

		try {

			Integer i = new Integer(var);

			System.out.println("A variável i vale " + i);

		} catch (NumberFormatException nfe) {

			System.out.println("Não é possível atribuir a string " + var

			+ " a um Objeto Inteiro.\n"

			+ "A seguinte mensagem foi retornada:\n\n"

			+ nfe.getMessage());

		}

	}

}
