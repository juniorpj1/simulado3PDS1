package dao.impl;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import dao.PedidoDao;
import dominio.Pedido;

public class PedidoDaoImpl implements PedidoDao {

	private EntityManager em;
	
	public PedidoDaoImpl() {
		this.em = EM.getLocalEm();
	}
	
	@Override
	public void inserirAtualizar(Pedido x) {
		if (x.getCodPedido() != null) {
			x = em.merge(x);
		}
		em.persist(x);
	}
	
	@Override
	public void excluir(Pedido x) {
		x = em.merge(x);
		em.remove(x);
	}
	
	@Override
	public Pedido buscar(int codPedido) {
		return em.find(Pedido.class, codPedido);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Pedido> buscarTodos() {
		String jpql = "SELECT x FROM Pedido x";
		Query query = em.createQuery(jpql);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Pedido> buscarPorData(Date dataInicial, Date dataFinal) {
		
		//String s = "SELECT a FROM Pedido a WHERE a.data >= dataInicial AND a.data <= dataFinal";
		String s = "SELECT a FROM Pedido a WHERE 1=1";
		
		if (dataInicial != null)
			s = s + " AND a.data >= :p1";
		if (dataFinal != null)
			s = s + " AND a.data <= :p2";
		
		Query query = em.createQuery(s);
		
		if (dataInicial != null)
			query.setParameter("p1", dataInicial);
		if (dataFinal != null)
			query.setParameter("p2", dataFinal);
		
		return query.getResultList();
	}
	
}
