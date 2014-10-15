<div class="container">
	<br />
	<h4>Tarefas</h4>
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
				<button class="btn btn-small btn-primary pull-right" type="button" onclick="location.href= '<?php echo $this->Html->url(array('controller' => 'Acao', 'action' => 'adicionar'), true);?>' ">Adicionar</button>
			</div>
			<?php 
			$url = $_SERVER['REQUEST_URI'];
			$url = explode("/", $url);
			$url = end($url);
			?>
			<div class="span1">
				<button class="btn btn-small btn-primary pull-left" type="button" onclick="location.href= '<?php echo $this->webroot;?>Tarefa/imprimirJobsEmAndamento/<?php echo $url; ?>' ">Imprimir</button>
			</div>
		</div>
	</div>
	</form>
	
	<div class="row-fluid">
		<legend>Jobs em andamentos</legend>
		<table cellpadding="0" cellspacing="0" class="table table-bordered table-hover table-condensed">
			<thead>
				<tr>
					<th><?php echo __('titulo'); ?></th>
					<th><?php echo __('data de início'); ?></th>
					<th><?php echo __('data final'); ?></th>
					<th><?php echo __('responsável'); ?></th>
					<th><?php echo __('supervisor'); ?></th>
					<th><center><?php echo __('Ações'); ?></center></th>
				</tr>
			</thead>
			<tbody>
			<?php foreach($tarefa as $tarefa){?>
				<tr>
					<td><?php echo $this->Html->link($tarefa['Tarefa']['titulo'], array('action' => 'visualizar', $tarefa['Tarefa']['id'])); ?>&nbsp;</td>
					<td><?php echo $tarefa['Tarefa']['data_inicio_previsto']; ?>&nbsp;</td>
					<td><?php echo $tarefa['Tarefa']['data_fim_previsto']; ?>&nbsp;</td>
					<td><?php echo $this->Html->link($tarefa['Responsavel']['Pessoa']['titulo'], array('controller' => 'Usuario','action' => 'visualizar', $tarefa['Responsavel']['id'])); ?>&nbsp;</td>
					<td><?php echo $this->Html->link($tarefa['Supervisor']['Pessoa']['titulo'], array('controller' => 'Usuario','action' => 'visualizar', $tarefa['Supervisor']['id'])); ?>&nbsp;</td>
					<td width="7%" nowrap="nowrap">
						<center>
						<?php 
							echo $this->Html->link(
								__(""),
								array('action' => 'editar', $tarefa['Tarefa']['id']),
								array('class'=>'icon-edit')
							);
							echo "&nbsp;&nbsp;";
							echo $this->Form->postLink(
								__(""), 
								array('action' => 'excluir', $tarefa['Tarefa']['id']), 
								array('class'=>'icon-trash'),
								__(Util::MENSAGEM_DELETAR, $tarefa['Tarefa']['id'])
							); 
						?>
						</center>
					</td>
				</tr>
				<?php } ?>
			</tbody>
		</table>
	</div>
	
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