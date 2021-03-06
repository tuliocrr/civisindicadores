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

// Carregamento das variáveis para controle de acesso

$adicionar = $this->ControleDeAcesso->validaAcessoElemento('adicionar');
$visualizar = $this->ControleDeAcesso->validaAcessoElemento('visualizar');
$editar = $this->ControleDeAcesso->validaAcessoElemento('editar');
$excluir = $this->ControleDeAcesso->validaAcessoElemento('excluir');
$imprimir = $this->ControleDeAcesso->validaAcessoElemento('imprimir');
$visualizarUsuario = $this->ControleDeAcesso->validaAcessoElemento('visualizar', 'Usuario');

?>
<script type="text/javascript">
  $(function() {
    $('.footable').footable();
  });
  $("#index1").treetable({ expandable: true});
  $("#index2").treetable({ expandable: true});
</script>
<div class="container">
	<br />
	<h4>Atividades</h4>
	<?php
		echo $this->FilterForm->create('',array('class' => 'well form-search'));
	?>
	<div class="row">
		<div class="span6">
			<div class="input-append">
				<?php
					echo $this->FilterForm->input('filter1');		
				?>
				<button type="submit" class="btn"><i class="icon-search"></i>&nbsp;</button>
			</div>
		</div>
		<div class="span5">				
			<div class="span3">
				<?php if($adicionar){?>
				<button class="btn btn-small btn-primary pull-right" type="button" onclick="location.href= '<?php echo $this->Html->url(array('controller' => 'Atividade', 'action' => 'adicionar'), true);?>' ">Adicionar</button>
				<?php }?>
			</div>
			<div class="span1">
				<?php if($imprimir){?>
				<button class="btn btn-small btn-primary pull-left" type="button" onclick="location.href= '<?php echo $this->webroot;?>Atividade/imprimirIndex/<?php echo $limit; ?>' ">Imprimir</button>
				<?php }?>
			</div>	
		</div>
	</div>
	</form>
	
	<div class="row-fluid">
		<legend>O que devo fazer?</legend>
		<table cellpadding="0" cellspacing="0" class="footable table table-bordered table-hover table-condensed" id="index1">
			<thead>
				<tr>
					<th data-class="expand"><?php echo __('titulo'); ?></th>
					<th data-hide="phone,tablet"><?php echo __('data de início'); ?></th>
					<th data-hide="phone,tablet"><?php echo __('data final'); ?></th>
					<th data-hide="phone,tablet"><?php echo __('responsável'); ?></th>
					<th data-hide="phone,tablet"><?php echo __('supervisor'); ?></th>
					<th data-hide="phone,tablet"><?php echo __('andamento'); ?></th>
					<?php if($editar || $excluir){?>
					<th><center><?php echo __('Ações'); ?></center></th>
					<?php }?>
				</tr>
			</thead>
			<tbody>
			<?php foreach($atividades as $atividade){?>
				<tr>
					<td>
						<?php
							if($visualizar){
								echo $this->Html->link($atividade['Atividade']['titulo'], array('action' => 'visualizar', $atividade['Atividade']['id']));
							}else{
								echo $atividade['Atividade']['titulo'];
							}
						?>&nbsp;
					</td>
					<td><?php echo $atividade['Atividade']['data_inicio_previsto']; ?>&nbsp;</td>
					<td><?php echo $atividade['Atividade']['data_fim_previsto']; ?>&nbsp;</td>
					<td>
						<?php
							if($visualizarUsuario){
								echo $this->Html->link($atividade['Responsavel']['Pessoa']['titulo'], array('controller' => 'Usuario','action' => 'visualizar', $atividade['Responsavel']['id']));
							}else{
								echo $atividade['Responsavel']['Pessoa']['titulo'];
							}
						?>&nbsp;
					</td>
					<td>
						<?php
							if($visualizarUsuario){
								echo $this->Html->link($atividade['Supervisor']['Pessoa']['titulo'], array('controller' => 'Usuario','action' => 'visualizar', $atividade['Supervisor']['id']));
							}else{
								echo $atividade['Supervisor']['Pessoa']['titulo'];
							}
						?>&nbsp;
					</td>
					<td>
					<?php
									
					if($atividade['Atividade']["status"]==5){
					
						if (strtotime(Util::inverteData($atividade["Atividade"]["data_conclusao"]))>strtotime(Util::inverteData($atividade["Atividade"]["data_fim_previsto"])))
							$barraProgresso="progress progress-danger progress-striped";
						else
							$barraProgresso="progress progress-success progress-striped";
					}else{
							
						if (time()>strtotime(Util::inverteData($atividade["Atividade"]["data_fim_previsto"])))
							$barraProgresso="progress progress-danger progress-striped";
						elseif (time()-604800>strtotime(Util::inverteData($atividade["Atividade"]["data_fim_previsto"])))
						$barraProgresso="progress progress-success progress-striped";
						else
							$barraProgresso="progress progress-warning progress-striped";
					}
										
					?>
					<div class="<?php echo $barraProgresso; ?>">
					  <div class="bar" style="width: <?php echo $atividade['Atividade']['andamento'];?>;"><?php echo $atividade['Atividade']['andamento'];?></div>
					</div>
	
					</td>
					<?php if($editar || $excluir){?>
					<td width="7%" nowrap="nowrap">
						<center>
						<?php 
							if($editar){
							echo $this->Html->link(
								__(""),
								array('action' => 'editar', $atividade['Atividade']['id']),
								array('class'=>'icon-edit')
							);
							echo "&nbsp;&nbsp;";
							}
							if($excluir){
							echo $this->Form->postLink(
								__(""), 
								array('action' => 'excluir', $atividade['Atividade']['id']), 
								array('class'=>'icon-trash'),
								__(Util::MENSAGEM_DELETAR, $atividade['Atividade']['id'])
							); 
							}
						?>
						</center>
					</td>
					<?php }?>
				</tr>
				<?php } ?>
			</tbody>
		</table>
	</div>
	<div class="row-fluid" style="margin-bottom: 20px">
		<button class="btn btn-small btn-primary pull-left" type="button" onclick="location.href= '<?php echo $this->Html->url(array('controller' => 'Atividade', 'action' => 'visualizarTodosResponsavel'), true);?>' ">Ver todos</button>
	</div>
	<div class="row-fluid">
		<legend>O que espero que façam?</legend>
		<table cellpadding="0" cellspacing="0" class="footable table table-bordered table-hover table-condensed" id="index2">
			<thead>
				<tr>
					<th data-class="expand"><?php echo __('titulo'); ?></th>
					<th data-hide="phone,tablet"><?php echo __('data de início'); ?></th>
					<th data-hide="phone,tablet"><?php echo __('data final'); ?></th>
					<th data-hide="phone,tablet"><?php echo __('responsável'); ?></th>
					<th data-hide="phone,tablet"><?php echo __('supervisor'); ?></th>
					<th data-hide="phone,tablet"><?php echo __('andamento'); ?></th>
					<?php if($editar || $excluir){?>
					<th><center><?php echo __('Ações'); ?></center></th>
					<?php }?>
				</tr>
			</thead>
			<tbody>
			<?php foreach($atividades2 as $atividade){?>
				<tr>
					<td>
						<?php
							if($visualizar){
								echo $this->Html->link($atividade['Atividade']['titulo'], array('action' => 'visualizar', $atividade['Atividade']['id']));
							}else{
								echo $atividade['Atividade']['titulo'];
							}
						?>&nbsp;
					</td>
					<td><?php echo $atividade['Atividade']['data_inicio_previsto']; ?>&nbsp;</td>
					<td><?php echo $atividade['Atividade']['data_fim_previsto']; ?>&nbsp;</td>
					<td>
						<?php
							if($visualizarUsuario){
								echo $this->Html->link($atividade['Responsavel']['Pessoa']['titulo'], array('controller' => 'Usuario','action' => 'visualizar', $atividade['Responsavel']['id']));
							}else{
								echo $atividade['Responsavel']['Pessoa']['titulo'];
							}
						?>&nbsp;
					</td>
					<td>
						<?php
							if($visualizarUsuario){
								echo $this->Html->link($atividade['Supervisor']['Pessoa']['titulo'], array('controller' => 'Usuario','action' => 'visualizar', $atividade['Supervisor']['id']));
							}else{
								echo $atividade['Supervisor']['Pessoa']['titulo'];
							}
						?>&nbsp;
					</td>
					<td>
					<?php
									
					if($atividade['Atividade']["status"]==5){
					
						if (strtotime(Util::inverteData($atividade["Atividade"]["data_conclusao"]))>strtotime(Util::inverteData($atividade["Atividade"]["data_fim_previsto"])))
							$barraProgresso="progress progress-danger progress-striped";
						else
							$barraProgresso="progress progress-success progress-striped";
					}else{
							
						if (time()>strtotime(Util::inverteData($atividade["Atividade"]["data_fim_previsto"])))
							$barraProgresso="progress progress-danger progress-striped";
						elseif (time()-604800>strtotime(Util::inverteData($atividade["Atividade"]["data_fim_previsto"])))
						$barraProgresso="progress progress-success progress-striped";
						else
							$barraProgresso="progress progress-warning progress-striped";
					}
										
					?>
					<div class="<?php echo $barraProgresso; ?>">
					  <div class="bar" style="width: <?php echo $atividade['Atividade']['andamento'];?>;"><?php echo $atividade['Atividade']['andamento'];?></div>
					</div>

					</td>
					<?php if($editar || $excluir){?>
					<td width="7%" nowrap="nowrap" align="center">
					
						<?php 
							if($editar){
							echo $this->Html->link(
								__(""),
								array('action' => 'editar', $atividade['Atividade']['id']),
								array('class'=>'icon-edit')
							);
							echo "&nbsp;&nbsp;";
							}
							if($excluir){
							echo $this->Form->postLink(
								__(""), 
								array('action' => 'excluir', $atividade['Atividade']['id']), 
								array('class'=>'icon-trash'),
								__(Util::MENSAGEM_DELETAR, $atividade['Atividade']['id'])
							); 
							}
						?>
					
					</td>
					<?php }?>
				</tr>
				<?php } ?>
			</tbody>
		</table>
		<div class="row-fluid" style="margin-bottom: 20px">
			<button class="btn btn-small btn-primary pull-left" type="button" onclick="location.href= '<?php echo $this->Html->url(array('controller' => 'Atividade', 'action' => 'visualizarTodosSupervisor'), true);?>' ">Ver todos</button>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<small>
					<form method="post" action="<?php echo $this->webroot; ?>Atividade">
						Exibir até <input type="text" class="span1" name="limit" value="<?php echo (int)$limit > count($atividades) ? $limit : count($atividades); ?>"> registros no total.
						<button type="submit" class="btn btn-primary">Enviar</button>
					</form>
				</small>	
			</div>	
			<div class="span6">
					<div class="pagination pagination-mini pull-right" style="margin:0;">
					</div>
				</div>
		</div>
	</div>
</div>