<?php 
/**
 *
 * Copyright [2014] -  Civis Gestão Inteligente
 * Este arquivo é parte do programa Civis Estratégia
 * O civis estratégia é um software livre, você pode redistribuí-lo e/ou modificá-lo dentro dos termos da Licença Pública Geral GNU como publicada pela Fundação do Software Livre (FSF) na versão 2 da Licença.
 * Este programa é distribuído na esperança que possa ser  útil, mas SEM NENHUMA GARANTIA, sem uma garantia implícita de ADEQUAÇÃO a qualquer  MERCADO ou APLICAÇÃO EM PARTICULAR. Veja a Licença Pública Geral GNU/GPL em português para maiores detalhes.
 * Você deve ter recebido uma cópia da Licença Pública Geral GNU, sob o título "licença GPL.odt", junto com este programa. Se não encontrar,
 * Acesse o Portal do Software Público Brasileiro no endereço www.softwarepublico.gov.br ou escreva para a Fundação do Software Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301, USA 
 *
 */
?>

<?php 
echo $this->Html->script(array('libs/jquery.maskedinput',
								'libs/jquery.maskMoney',
								'libs/bootstrap.min',
								'libs/geral',
								'libs/jquery.ui.datepicker'));
echo $this->fetch('script');
echo $this->Js->writeBuffer(); // note: write cached scripts 
?>

<script>
$(function() {
	$.datepicker.setDefaults( $.datepicker.regional[""] );
	$(".datepicker").datepicker( $.datepicker.regional["pt-BR"] );
});
</script>