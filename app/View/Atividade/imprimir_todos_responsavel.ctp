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
echo $this->Html->css('bootstrap.min');
echo $this->Html->css('bootstrap-responsive.min');
?>
<div class="row-fluid">
	<legend>O que devo fazer?</legend>
	<table cellpadding="0" cellspacing="0" class="table table-bordered table-hover table-condensed">
		<thead>
			<tr>
				<th><?php echo __('titulo'); ?></th>
				<th><?php echo __('data de início'); ?></th>
				<th><?php echo __('data final'); ?></th>
				<th><?php echo __('responsável'); ?></th>
				<th><?php echo __('supervisor'); ?></th>
				<th><?php echo __('andamento'); ?></th>
			</tr>
		</thead>
		<tbody>
		<?php foreach($atividade as $atividade){?>
			<tr>
				<td><?php echo $atividade['Atividade']['titulo']; ?>&nbsp;</td>
				<td><?php echo $atividade['Atividade']['data_inicio_previsto']; ?>&nbsp;</td>
				<td><?php echo $atividade['Atividade']['data_fim_previsto']; ?>&nbsp;</td>
				<td><?php echo $atividade['Responsavel']['Pessoa']['titulo']; ?>&nbsp;</td>
				<td><?php $atividade['Supervisor']['Pessoa']['titulo']; ?>&nbsp;</td>
				<td><?php echo $atividade['Atividade']['andamento']; ?>&nbsp;</td>
			</tr>
			<?php } ?>
		</tbody>
	</table>
</div>