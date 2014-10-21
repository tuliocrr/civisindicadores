<?php
	$editar = $this->ControleDeAcesso->validaAcessoElemento('editar');
	$excluir = $this->ControleDeAcesso->validaAcessoElemento('excluir');
	$visualizarUsuario = $this->ControleDeAcesso->validaAcessoElemento('visualizar', 'Usuario');
	$visualizarTarefa = $this->ControleDeAcesso->validaAcessoElemento('visualizar', 'Tarefa');
	$adicionarTarefa = $this->ControleDeAcesso->validaAcessoElemento('adicionar', 'Tarefa');
?>
<div class="container">
	<legend>Visualizar Reunião</legend>
	<div class="buttons">
		<?php
		if($editar){
		echo $this->Html->link(
					__("<i class='fa fa-edit'></i>Editar"),
					array('action' => 'editar', $reuniao[0]['Reuniao']['id']),
					array('class'=>'btn btn-small btn-primary pull-right', 'escape' => false)
				);
		echo "&nbsp;&nbsp;";
		}
		if($excluir){
		echo $this->Form->postLink(
					__("<i class='fa fa-trash'></i>Deletar"), 
					array('action' => 'excluir', $reuniao[0]['Reuniao']['id']), 
					array('class'=>'btn btn-small btn-primary pull-right', 'escape' => false),
					__(Util::MENSAGEM_DELETAR, $reuniao[0]['Reuniao']['id'])
				);
		}
		?>
	</div>
	<br />
	<div class="row">
		<div class="span12">
			<table cellpadding="0" cellspacing="0" class="table table-bordered table-hover table-condensed">
				<tbody>
					<tr>
						<td><strong><?php echo __('Titulo'); ?></strong></td>
						<td><?php echo h($reuniao[0]['Reuniao']['titulo']); ?></td>
					</tr>
					<tr>
						<td><strong><?php echo __('Data'); ?></strong></td>
						<td><?php echo h($reuniao[0]['Reuniao']['data']); ?></td>
					</tr>
					<tr>
						<td><strong><?php echo __('Horário'); ?></strong></td>
						<td><?php echo h($reuniao[0]['Reuniao']['hora_inicio']); ?></td>
					</tr>
					<tr>
						<td><strong><?php echo __('Pauta'); ?></strong></td>
						<td><?php echo ($reuniao[0]['Reuniao']['pauta']); ?></td>
					</tr>
					<tr>
						<td><strong><?php echo __('Ata'); ?></strong></td>
						<td><?php echo ($reuniao[0]['Reuniao']['ata']); ?></td>
					</tr>
					<tr>
						<td><strong><?php echo __('Participantes'); ?></strong></td>
						<td>
							<ul>
								<?php foreach($reuniao[0]['Participantes'] as $value){?>
									<li><?php 
										if($visualizarUsuario){
											echo $this->Html->link($value['titulo'], array('controller' => 'Usuario', 'action' => 'visualizar', $value['id']));
										}else{
											echo $value['titulo'];
										}
										
										?></li>
								<?php } ?>
							</ul>
							&nbsp;
						</td>
					</tr>
					<tr>
						<td><strong><?php echo __('Tarefas'); ?></strong></td>
						<td>
							<ul class="nav nav-tabs nav-stacked">
							<?php
							if(isset($reuniao[0]['Tarefa'])){
								foreach ($reuniao[0]['Tarefa'] as $key => $value) {
								?>
									<li><?php 
									if($visualizarTarefa){
										echo $this->Html->link($value['titulo'], array('controller' => 'Tarefa', 'action' => 'visualizar', $value['id']));
										}else{
											echo "<a>". $value['titulo'] . "</a>";
										}
									?></li>
								<?php
								}
							}
							?>
							<div class="row-fluid" style="margin-top: 10px;">
								<?php if($adicionarTarefa){?>
								<button class="btn btn-mini" type="button" onclick="abrirModal(<?php echo $reuniao[0]['Reuniao']['id']; ?>)">Adicionar</button>
								<?php }?>
							</div>
							</ul>
							&nbsp;	
						</td>
					</tr>
				</tbody>				
			</table>			
		</div>
	</div>
</div>
<div id="dialog" title="Cadastrar Tarefa" style="display: none">
</div>
<script>
	function abrirModal(idReuniao){
		var action = "<?php echo $this->webroot;?>Tarefa/ajaxAdicionar/" + idReuniao;
		$.get(
			action,
			{},
			function(data){
				$("#dialog").html(data);
				$("#dialog").css("display", "block");
			    $("#dialog").dialog({
			    	height: 400,
			    	width: 380,
			    	modal: true
			    });
			    $("#salvar").click(function(){
					var action = <?php echo $this->webroot; ?> + "Tarefa/ajaxAdicionar/" + idReuniao;
					$.post(
						action,
						$("#TarefaAjaxAdicionarForm").serialize(),
						function(data){
							alert(data);
							$(window.document.location).attr('href',"<?php echo $this->webroot; ?>Reuniao/visualizar/" + idReuniao);
						}
					);
				});
			}
		);
		
	}
</script>