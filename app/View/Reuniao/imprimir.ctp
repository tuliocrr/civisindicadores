<?php 
echo $this->Html->css('bootstrap.min');
echo $this->Html->css('bootstrap-responsive.min');
?>
<div class="container">
	<legend>Documento de reunião</legend>
	<div class="row-fluid" style="margin-bottom: 20px">
		<table class="table table-bordered">
			<tbody>
				<tr style="background-color: #f5f5f5">
					<td colspan="2">
						<b><?php echo $reuniao[0]['Reuniao']['titulo']; ?></b>
					</td>
				</tr>
				<tr>
					<td>
						<b>Local:</b>
					</td>
					<td>
						<?php echo $reuniao[0]['Reuniao']['local']; ?>
					</td>
				</tr>
				<tr>
					<td>
						<b>Data:</b>
					</td>
					<td>
						<?php echo $reuniao[0]['Reuniao']['data']; ?>
					</td>
				</tr>
				<tr>
					<td>
						<b>Pauta:</b>
					</td>
					<td>
						<?php echo $reuniao[0]['Reuniao']['pauta']; ?>
					</td>
				</tr>
				<tr>
					<td>
						<b>Horário de início:</b>
					</td>
					<td>
						<?php echo $reuniao[0]['Reuniao']['hora_inicio']; ?>
					</td>
				</tr>
				<tr>
					<td>
						<b>Horário de térimino:</b>
					</td>
					<td>
						<?php echo $reuniao[0]['Reuniao']['hora_fim']; ?>
					</td>
				</tr>
				<tr style="background-color: #f5f5f5">
					<td colspan="2">
						<b>Participantes:</b>
					</td>
				</tr>
				<?php foreach($reuniao[0]['Participantes'] as $participante){ ?>
					<tr>
						<td>
							<?php echo $participante['titulo']; ?>
						</td>
						<td>
							<?php echo $participante['email']; ?>
						</td>
					</tr>
				<?php } ?>
				<tr style="background-color: #f5f5f5">
					<td colspan="2">
						<b>Conhecimento:</b>
					</td>
				</tr>
				<?php foreach($reuniao[0]['Conhecedores'] as $conhecedor){ ?>
					<tr>
						<td>
							<?php echo $conhecedor['titulo']; ?>
						</td>
						<td>
							<?php echo $conhecedor['email']; ?>
						</td>
					</tr>
				<?php } ?>
			</tbody>
		</table>
	</div>
	<div class="row-fluid">
		<table class="table table-bordered">
			<thead>
				<tr style="background-color: #f5f5f5">
					<th>Tarefas</th>
					<th>Início</th>
					<th>Fim</th>
					<th>Responsável</th>
				</tr>
			</thead>
			<tbody>
				
				<?php foreach($reuniao[0]['Tarefa'] as $tarefa){ ?>
					<tr>
						<td><?php echo $tarefa['titulo']; ?></td>
						<td><?php echo $tarefa['data_inicio_previsto']; ?></td>
						<td><?php echo $tarefa['data_fim_previsto']; ?></td>
						<td><?php echo $tarefa['Responsavel'][0]['titulo']; ?></td>
					</tr>	
				<?php } ?>
			</tbody>
		</table>
	</div>
</div>
