package aplicacao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import servico.PedidoServico;
import servico.ServicoFactory;

public class principal {

	public static void main(String[] args) throws ParseException {
		PedidoServico pedidoService = ServicoFactory.criarPedidoServico();
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		
		Date dataInicial = sdf.parse("01/01/2013");
		Date dataFinal = sdf.parse("01/01/2017");
		
		System.out.println(pedidoService.buscarPorData(dataInicial, dataFinal));

	}

}
