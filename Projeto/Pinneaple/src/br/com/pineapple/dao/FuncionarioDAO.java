package br.com.pineapple.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.pineapple.domain.Funcionario;
import br.com.pineapple.factory.ConexaoFactory;

public class FuncionarioDAO{
	public void salvar(Funcionario f) throws SQLException{
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO funcionario ");
		sql.append("(cpf, nome, email )");
		sql.append("VALUES(?,?,?)");
		
		Connection conexao = ConexaoFactory.conectar();
		
		PreparedStatement comando = conexao.prepareStatement(sql.toString());
		comando.setString(1, f.getCpf());
		comando.setString(2, f.getNome());
		comando.setString(3, f.getEmail());
		
		comando.executeUpdate();
		
	}
	
	public Funcionario consultarCPF(Funcionario f) throws SQLException{
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT cpf, nome ");
		sql.append("FROM funcionario ");
		sql.append("WHERE cpf = ?");
		
		Connection conexao = ConexaoFactory.conectar();
		
		PreparedStatement comando = conexao.prepareStatement(sql.toString());
		comando.setString(1, f.getCpf());
		
		ResultSet resultado = comando.executeQuery();
		
		Funcionario retorno = null;
		
		if(resultado.next()) {
			retorno = new Funcionario();
			retorno.setCpf(resultado.getString("cpf"));
			retorno.setNome(resultado.getString("nome"));
		}
		
		return retorno;
	}
	
	public void atualizar(Funcionario f) throws SQLException{
		StringBuilder sql = new StringBuilder();
		
		sql.append("UPDATE funcionario ");
		sql.append("SET nome = ? ");
		sql.append("WHERE cpf = ?");
		
		Connection conexao = ConexaoFactory.conectar();
		
		PreparedStatement comando = conexao.prepareStatement(sql.toString());
		comando.setString(1, f.getNome());
		comando.setString(2, f.getCpf());
		comando.executeUpdate();
	}
	
	public void excluir(Funcionario f) throws SQLException{
		StringBuilder sql = new StringBuilder();
		sql.append("DELETE FROM funcionario ");
		sql.append("WHERE cpf = ?");
		
		Connection conexao = ConexaoFactory.conectar();
		
		PreparedStatement comando = conexao.prepareStatement(sql.toString());
		comando.setString(1, f.getNome());	
		comando.executeUpdate();
		
		}
	
	public ArrayList<Funcionario> listar() throws SQLException{
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT cpf, nome, email ");
		sql.append("FROM funcionario ");
		sql.append("ORDER BY nome ASC ");
		
		Connection conexao = ConexaoFactory.conectar();
		
		PreparedStatement comando = conexao.prepareStatement(sql.toString());
		ResultSet resultado = comando.executeQuery();
		
		ArrayList<Funcionario> lista = new ArrayList<Funcionario>();
		
		while(resultado.next()) {
			Funcionario f = new Funcionario();
			f.setCpf(resultado.getString("cpf"));
			f.setNome(resultado.getString("nome"));
			f.setEmail(resultado.getString("email"));
			
			lista.add(f);
		}
		
		return lista;
		
	}
	
}