<?php 
/**
*
* Copyright [2014] -  Civis Gestão Inteligente
* Este arquivo é parte do programa Civis Estratégia
* O civis estratégia é um software livre, você pode redistribuí-lo e/ou modificá-lo dentro dos termos da Licença Pública Geral GNU como publicada pela Fundação do Software Livre (FSF) na versão 2 da Licença.
* Este programa é distribuído na esperança que possa ser útil, mas SEM NENHUMA GARANTIA, sem uma garantia implícita de ADEQUAÇÃO a qualquer  MERCADO ou APLICAÇÃO EM PARTICULAR. Veja a Licença Pública Geral GNU/GPL em português para maiores detalhes.
* Acesse o Portal do Software Público Brasileiro no endereço www.softwarepublico.gov.br ou escreva para a Fundação do Software Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301, USA
*
*/
?>
<div class="container">
	<?php echo $this->Form->create('Tarefa', array('type' => 'file')); ?>
 		<fieldset>
 			<legend>Editar Tarefa</legend>	
 			<div class="row">
  				<div class="span6">
  					<legend>Dados Básicos</legend>
  				<?php
  					echo $this->Form->input('id');
					echo $this->Form->input('titulo', array('label' => 'Título','class'=>'input-xlarge'));
					echo $this->Form->input('prioridade', array('class'=>'input-xlarge', 'type' => 'select', 'values' => $prioridades));
					echo $this->Form->input('data_inicio_previsto', array('label' => 'Data Inicial','type' => 'text','class'=>'input-xlarge data datepicker'));
					echo $this->Form->input('data_fim_previsto', array('label' => 'Data Final','type' => 'text','class'=>'input-xlarge data datepicker'));
					echo $this->Form->input('lembrete', array('label' => 'Lembrete','type' => 'text','class'=>'input-xlarge data datepicker'));
					echo $this->Form->input('responsavel_id', array('label' => 'Responsável','class'=>'input-xlarge', 'empty' => 'Selecione o Responsável','type' => 'select','options' => $usuarios));
					echo $this->Form->input('supervisor_id', array('label' => 'Supervisor','class'=>'input-xlarge', 'empty' => 'Selecione o Supervisor','type' => 'select','options' => $usuarios));
					echo $this->Form->input('status', array('label' => 'Status','class'=>'input-xlarge', 'empty' => 'Selecione o Status','type' => 'select','options' => $status));
					echo $this->Form->input('acao_id', array('label' => 'Atividade','class'=>'input-xlarge', 'empty' => 'Selecione a Atividade','type' => 'select','options' => $acoes));										
					echo $this->Form->input('data_conclusao', array('label' => 'Data de Conclusão','type' => 'text','class'=>'input-xlarge data datepicker'));
					echo $this->Form->input('comentario', array('label' => 'Comentário', 'class'=>'input-xlarge jqte-test'));
					echo $this->Form->input('arquivo', array('class'=>'input-xlarge', 'type' => 'file'));
					echo $this->Form->input('arquivo_dir', array('type' => 'hidden'));
				?>
				</div>
  				<div class="span6">
  					<legend>Relações</legend>
  					<div class="text-center">
	  					<label class="radio inline">
						  <input type="radio" name="optionsRadios" id="optionsRadios1" value="0" checked>
						  Exibir relações desta tarefa
						</label>
						<label class="radio inline">
						  <input type="radio" name="optionsRadios" id="optionsRadios2" value="1">
						  Não exibir relações desta tarefa
						</label>
					</div>
					<span id="relacoes" style="display: none; margin-top: 10px">
						<?php 
							echo $this->Form->input('acao_id', array('label' => 'Ação','class'=>'input-xlarge', 'empty' => 'Selecione o Ação','type' => 'select','options' => $acoes));										
							echo $this->Form->input('reuniao_id', array('label' => 'Reunião','class'=>'input-xlarge', 'empty' => 'Selecione o Reunião','type' => 'select','options' => $reunioes));
						?>
					</span>
  				</div>
  			</div>
 			<div class="row">
 				<div class="span12">
 					<div class="form-actions">
  						<button type="submit" class="btn btn-primary">Salvar</button>
					</div>
 				</div>
 			</div>
 		</fieldset>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript" src="<?php echo $this->base?>/js/jquery-te-1.4.0.min.js"></script>
<link type="text/css" rel="stylesheet" href="<?php echo $this->base?>/css/jquery-te-1.4.0.css">
<script>
	$(document).ready(function(){
		$("input[name=optionsRadios]").change(function(){
			if($(this).val() == 0){
				$("#relacoes").css("display", "none");
			}else{
				$("#relacoes").css("display", "block");
			}
		})
	});
</script>
<script>
	$('.jqte-test').jqte();
	
	// settings of status
	var jqteStatus = true;
	$(".status").click(function()
	{
		jqteStatus = jqteStatus ? false : true;
		$('.jqte-test').jqte({"status" : jqteStatus})
	});
</script>
