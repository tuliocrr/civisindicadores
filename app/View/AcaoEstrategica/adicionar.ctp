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
<div class="container">
	<?php echo $this->Form->create('AcaoEstrategica'); ?>	
 		<fieldset>
 			<legend>Cadastro de Ações</legend>
 			<div class="row">
  			<div class="span12">  				
  				<?php
					echo $this->Form->input('titulo', array('class'=>'input-xlarge'));
					echo $this->Form->input('ordem', array('class'=>'input-xlarge', 'empty' => 'Selecione a Ordem','type' => 'select','options' => $ordem));
					echo $this->Form->input('prioridade', array('class'=>'input-xlarge', 'type' => 'select', 'values' => $prioridades));
					echo $this->Form->input('dimensao_id', array('class'=>'input-xlarge', 'empty' => 'Selecione a Dimensão','type' => 'select','options' => $dimensoes));
					echo $this->Form->input('ano', array('class'=>'input-xlarge', 'empty' => 'Selecione o ano','type' => 'select','options' => Util::anos()));
					echo $this->Form->input('usuario_id', array('label' => 'Responsável','class'=>'input-xlarge', 'empty' => 'Selecione o Responsável','type' => 'select','options' => $usuarios));
					echo $this->Form->input('andamento', array('label' => 'Andamento','class'=>'input-xlarge','type' => 'select','options' => $andamento));
					echo $this->Form->input('status', array('label' => 'Status','class'=>'input-xlarge', 'empty' => 'Selecione o Status','type' => 'select','options' => $status_acaoestrategica));
					echo $this->Form->input('situacao', array('label' => 'Situação','class'=>'input-xlarge', 'empty' => 'Selecione a Situação','type' => 'select','options' => $situacao));
					echo $this->Form->input('situacao_desc', array('label' => 'Descrição da Situação','class'=>'input-xxlarge textarea'));
					echo $this->Form->input('resultado', array('label' => 'Resultados','class'=>'input-xxlarge textarea'));
					echo $this->Form->input('providencia', array('label' => 'Providências','class'=>'input-xxlarge textarea'));
					echo $this->Form->input('restricao', array('label' => 'Restrições','class'=>'input-xxlarge textarea'));
					echo $this->Form->input('riscos', array('label' => 'Riscos','class'=>'input-xxlarge textarea'));
					echo $this->Form->input('observacoes', array('label' => 'Observações','class'=>'input-xxlarge textarea'));
					echo $this->Form->input('data_ultima_atualizacao', array('label' => 'Última Atualização','type' => 'text','class'=>'input-xlarge data datepicker'));
					
					echo $this->Form->input('objetivo_id', array('label' => 'A que ação ou objetivo esta ação está associada?','div' => array('id' => 'medida_id'),'class'=>'input-xlarge', 'empty' => 'Selecione a ação','type' => 'select','options' => $acoesEstrategicas));
					
				?>
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
	$('.jqte-test').jqte();
	
	// settings of status
	var jqteStatus = true;
	$(".status").click(function()
	{
		jqteStatus = jqteStatus ? false : true;
		$('.jqte-test').jqte({"status" : jqteStatus})
	});
</script>
