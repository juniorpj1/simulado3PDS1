package controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dominio.Pedido;
import servico.PedidoServico;
import servico.ServicoFactory;


@WebServlet("/Questao1Servlet")
public class Questao1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LISTAR_PEDIDOS = "listarPedido.jsp";
	private static String DETALHE_PEDIDOS = "detalhePedido.jsp";
	private static String ERRO = "erro.jsp";
	
       
    public Questao1Servlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PedidoServico pedidoService = ServicoFactory.criarPedidoServico();
		String forward = "";
		String cmd = request.getParameter("cmd");
		
		if (cmd.equalsIgnoreCase("detalhes")) {
			int cod = Integer.parseInt(request.getParameter("cod"));

			try {
				Pedido pedido = pedidoService.buscar(cod);
				request.setAttribute("pedido", pedido);
				forward = DETALHE_PEDIDOS;
			} catch (RuntimeException e) {
				request.setAttribute("erro", "Erro de execução: " + e.getMessage());
				forward = ERRO;
			}
			RequestDispatcher rd = request.getRequestDispatcher(forward);
			rd.forward(request, response);
		}
		
	}

	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PedidoServico pedidoService = ServicoFactory.criarPedidoServico();
		String forward = "";

		String dataEmTexto = request.getParameter("dataInicial");
		String dataEmTexto2 = request.getParameter("dataFinal");

		try {
			List<Pedido> lista1 = pedidoService.buscarPorData(new Date(dataEmTexto), new Date(dataEmTexto2));
			request.setAttribute("lista", lista1);
			forward = LISTAR_PEDIDOS;
		} catch (RuntimeException e) {
			request.setAttribute("erro", "Erro de execução: " + e.getMessage());
			forward = ERRO;
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(forward);
		rd.forward(request, response);

	}

}
