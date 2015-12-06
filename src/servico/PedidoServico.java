package servico;

import java.util.Date;
import java.util.List;

import dominio.Pedido;

public interface PedidoServico {
	
	public void inserirAtualizar(Pedido x);
	public void excluir(Pedido x);
	public Pedido buscar(int cod);
	public List<Pedido> buscarTodos();
	public List<Pedido> buscarPorData(Date dataInicial, Date dataFinal);
}
