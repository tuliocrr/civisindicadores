<?php
	$visualizar = $this->ControleDeAcesso->validaAcessoElemento('visualizar');
	$visualizarDimensao = $this->ControleDeAcesso->validaAcessoElemento('visualizar', 'Dimensao');
?>
<script type="text/javascript">
  $(function() {
    $('.footable').footable();
  });
  $("#index").treetable({ expandable: true});
</script>
<div class="container">
	<br />
	<h4>Painel de Revisão de Ações (DTI)</h4>
	<form method="post" class="well form-search">
		<div class="list-actions row-fluid">
			<!-- Filtros -->
			<div class="list-filters pull-left">
				<div class="with-select">
					<input name="data[Medida][busca]" placeholder="O que você procura?" type="text" id="MedidaBusca">
					<?php $options = array('Medida.titulo' => 'Título','Medida.ano'=>'Ano','Medida.situacao'=>'Situação','Medida.prioridade'=>'Prioridade', 'Medida.data_ultima_atualizacao'=>'Última Atualização');?>
					<select name="data[Medida][buscar_em]" id="MedidaBuscarEm">
						<option value="Medida.titulo">Filtrar em:</option>					
						<?php foreach($options as $key => $value){?>
						<option value="<?php echo $key; ?>"><?php echo $value;?></option>
						<?php } ?>
					</select>
					<button type="submit" class="btn"><i class="icon-search fa fa-search"></i></button>
				</div>
				<div class="filters-tags">
					<?php
					if(isset($_SESSION['Search']['Medida'])){
						if(count($_SESSION['Search']['Medida'])>0){
						?>
						<h4 class="title">Filtrado por:</h4>
						<?php
							foreach($_SESSION['Search']['Medida'] as $key => $temo_busca){
						?>
							<span class="type-tag"><?php echo $options[$temo_busca['buscar_em']]?>: <?php echo $temo_busca['busca']?><?php echo $this->Html->link("", array("action" => "excluirFiltro", $key, 'indice_revisao'), array("class" => "fa fa-times")); ?></span>
						<?php	
							}
						}
					}
					?>
				</div>
			</div><!-- /.list-filters -->
				<!--div class="list-actions-buttons pull-right">				
				<button class="btn btn-small btn-primary" type="button" onclick="location.href='<?php echo $this->webroot; ?>Medida/adicionar' "><i class="fa fa-plus-circle"></i>Adicionar</button>
			</div><!-- /.list-actions -->
			<!-- end Filtros -->
		</div>
	</form>
	
	<table cellpadding="0" cellspacing="0" class="footable table table-bordered table-hover table-condensed" id="index">
		<thead>
			<tr>
				<th data-hide="phone,tablet" width='10'><?php echo $this->Paginator->sort('Medida.situacao', 'Situação'); ?></th>
				<th data-class="expand"><?php echo $this->Paginator->sort('Medida.prioridade', 'Prioridade'); ?></th>
				<th data-class="expand"><?php echo $this->Paginator->sort('Medida.andamento', 'Andamento'); ?></th>
				<th data-class="expand"><?php echo $this->Paginator->sort('Medida.titulo', 'Título'); ?></th>
				
				<th data-hide="phone,tablet"><?php echo $this->Paginator->sort('Dimensao.titulo', 'Dimensão'); ?></th>
				<th data-hide="phone,tablet"><?php echo $this->Paginator->sort('Medida.data_ultima_atualizacao', 'Atualização'); ?></th>
				<th data-hide="phone,tablet"><?php echo $this->Paginator->sort('Medida.data_ultima_revisao', 'Revisão'); ?></th>
				<!--th data-hide="phone,tablet"><?php echo $this->Paginator->sort('ano'); ?></th-->
				<!--th data-hide="phone,tablet"><?php echo __('Projetos associados'); ?></th-->
				
				<!--th><center><?php echo __('Ações'); ?></center></th-->
			</tr>
		</thead>
		<tbody>
		<?php 
		foreach($medida as $medida){?>
			<tr>
				<td><?php $situacao = $medida['Medida']['situacao']; 
				$situacaoNome = "";
				switch ($situacao) {
					case Util::NAO_INFORMADO:
						$situacaoNome = "<acronym title='Não Informado' ><span class='label label-default'>".$medida['Medida']['andamento']."</span></acronym>";
						break;
					case Util::ADEQUADO:
						$situacaoNome = "<acronym title='Adequado' ><span class='label label-success'>".$medida['Medida']['andamento']."</span></acronym>";
						break;
					case Util::ATENCAO:
						$situacaoNome = "<acronym title='Atenção' ><span class='label label-warning'>".$medida['Medida']['andamento']."</span></acronym>";
						break;
					case Util::CONCLUIDO:
						$situacaoNome = "<acronym title='Concluído' ><span class='label label-primary'>".$medida['Medida']['andamento']."</span></acronym>";
						break;
					case Util::PREOCUPANTE:
						$situacaoNome = "<acronym title='Preocopante' ><span class='label label-danger'>".$medida['Medida']['andamento']."</span></acronym>";
						break;

				}
				
				echo  $situacaoNome;
				?>&nbsp;</td>
				<td>
				<div class="progress progress-success progress-striped">
						<div class="bar" style="width: <?php echo $medida['Medida']['andamento'];?>"></div>
				</div>
				</td>
				<td><?php echo $medida['Medida']['prioridade'];?></td>
				<td>
					<?php
					if($visualizar){
						echo $this->Html->link($medida['Medida']['titulo'], array('action' => 'visualizar', $medida['Medida']['id']));
					}else{
						echo $medida['Medida']['titulo'];
					}
					?>&nbsp;
				</td>
				<td>
					<?php
					if($visualizarDimensao){
						echo $this->Html->link($medida['Dimensao']['titulo'], array('controller' => 'Dimensao','action' => 'visualizar', $medida['Dimensao']['id']));
					}else{
						echo $medida['Dimensao']['titulo'];
					}
					?>&nbsp;
				</td>
				<td><?php echo $medida['Medida']['data_ultima_atualizacao'];?></td>
				<td><?php echo $medida['Medida']['data_ultima_revisao'];?></td>
				<!--td><?php echo $medida['Medida']['ano'];?></td-->
				<!--td class="no-padding">
					<ul class="list-inner">
					<?php
					
					if(isset($projetos[$medida['Medida']['id']])){
						foreach ($projetos[$medida['Medida']['id']] as $key => $value) {

							if($value["Projeto"]['status'] != Util::INATIVO){
							
						?>
							<li>
								<div class="wrapper">
								<div class="text">
									<?php
									if($value["Projeto"]["concluido"]==1){
										echo '<span class="icon-check fa fa-check-square-o"></span>';
									}
									
									?>
										<abbr>
										<?php echo $this->Html->link($value["Projeto"]['titulo'], array('controller' => 'Projeto', 'action' => 'revisar', $value["Projeto"]['id'])); ?>	
										</abbr>
									
									</div>									
								</div>
							</li>
						<?php
							}
						}
					}
					?>
					</ul>
					
				</td-->
				<!--td width="7%" nowrap="nowrap">
					<center>
					<?php 
						echo $this->Html->link(
							__(""),
							array('action' => 'editar', $medida['Medida']['id']),
							array('class'=>'icon-edit')
						);
						echo "&nbsp;&nbsp;";
						echo $this->Form->postLink(
							__(""), 
							array('action' => 'excluir', $medida['Medida']['id']), 
							array('class'=>'icon-trash'),
							__(Util::MENSAGEM_DELETAR, $medida['Medida']['id'])
						); 
					?>
					</center>
				</td-->
			</tr>
			<?php } ?>
		</tbody>
	</table>
	
	<div class="row">
		<div class="span6">
			<small>
				<?php
				echo $this->Paginator->counter(array(
				'format' => __(Util::MENSAGEM_PADRAO_PAGINACAO)
				));
				?>
			</small>	
		</div>	
		<div class="span6">
				<div class="pagination pagination-mini pull-right" style="margin:0;">
				<ul>
				<?php
					echo $this->Paginator->prev(__(Util::ANTERIOR_PAGINACAO), array(
						'escape'=>false,
						'tag'=>'li'
					), '<a onclick="return false;">' . Util::ANTERIOR_PAGINACAO . '</a>', 
					array('class'=>'disabled prev','escape'=>false,'tag'=>'li'));
					
					echo $this->Paginator->numbers(
						array(
							'separator' => '',
							'currentClass' => 'active',
							'currentTag' => 'a',
							'tag'=>'li'
						)
					);
					
					echo $this->Paginator->next(__(Util::PROXIMO_PAGINACAO), array(
						'escape'=>false,
						'tag'=>'li'
					), '<a onclick="return false;">' . Util::PROXIMO_PAGINACAO . '</a>', 
					array('class'=>'disabled next','escape'=>false,'tag'=>'li'));
			
				?>
				</ul>
				</div>
			</div>
	</div>
</div>