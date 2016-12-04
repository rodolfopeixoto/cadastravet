#!/bin/env ruby
# encoding: utf-8

#https://goo.gl/DI1HFK

@nome=[]
@data=[]
@relatorio=[]


def menu_do_programa
  puts "**********************************************"

  puts "1) Dados pessoais  "
  puts "2) Exibir Histórico "
  puts "3) Buscar por Data "
  puts "4) Busca por Nome "
  puts "5) Editar Registro"
  puts "6) Sair"

  puts "**********************************************"
end

def opcao_desejada(opcao)
  case opcao
    when "1"
      cadastrar_animal
      puts "Inserido com sucesso!"
    when "2"
      todos_os_registros
    when "3"
      puts "Digite a data da consulta que deseja pesquisar ex 12-12-1991: "
      data = gets.chomp
      busca_por_data(data)
    when "4"
      consultas_de_um_animal
    when "5"
      editar_dados
    when "6"
      puts "Obrigado por utilizar o programa!"
    end
end

def cadastrar_animal
  puts "Nome do animal:"
  @nome.push(gets.chomp)
  puts "Data de nascimento do animal:"
  @data << gets.chomp
  puts "Relatório:"
  @relatorio << gets.chomp
  puts ""
end

def busca_por_data(data_animal)
  for contador in (0...@nome.size)
    if (data_animal == @data[contador])
      puts "---------------------------------------"
      puts "Nome: #{@nome[contador]}"
      puts "Data: #{@data[contador]}"
      puts "Relatório: #{@relatorio[contador]}"
    end
  end
end


def consultas_de_um_animal
     puts 'Digite o nome do animal, para ter o relatório das consultas:'
     nome_digitou = gets.chomp
        for contador in (0..@nome.size)
          if (nome_digitou == @nome[contador])
           puts "---------------------------------------"
           puts "Nome: #{@nome[contador]}"
           puts "Data: #{@data[contador]}"
           puts "Relatório: #{@relatorio[contador]}"
           puts ""
          end
        end
end

def todos_os_registros
  puts "Total de registros: #{@nome.size}"

  if @nome.size == 0
    puts "Não existe registro!"
  else
    for contador in (0...@nome.size)
        puts "---------------------------------------"
        puts "Index: #{contador}"
        puts "Nome: #{@nome[contador]}"
        puts "Data: #{@data[contador]}"
        puts "Relatório: #{@relatorio[contador]}"
        puts ""
        end
  end
end

def editar_dados
  todos_os_registros
  puts ""
  puts ""
  puts "Digite o número do index: "

  index = gets.chomp

  for contador in (0...@nome.size)
    if(index.to_i == contador)
      puts "Nome atual: #{@nome[contador]}"
      puts "Edite o nome: "
      name = gets.chomp
      @nome[contador] = name unless name == "\n"
      puts "Data atual: #{@data[contador]}"
      puts "Edite a data: "
      date = gets.chomp
      @data[contador] = date unless date == "\n"
      puts "Relatório atual: #{@relatorio[contador]}"
      puts "Edite o relatório: "
      rel = gets.chomp
      @relatorio[contador] = rel unless rel == "\n"
    end
  end
end


def programa_principal
  loop do

     menu_do_programa

     puts "Digite a opção desejada"
     opcao = gets.chomp

     opcao_desejada(opcao)

    break if opcao.eql? "6"
  end
end

programa_principal