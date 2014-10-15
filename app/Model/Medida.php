<?php
App::uses('AppModel', 'Model');


/**
 * Objetivo Model
 *
 * @property Usuario $Usuario
 */
class Medida extends AppModel {

	var $useTable = "objetivo";
	
/**
 * Validation rules
 *
 * @var array
 */
	
 public $validate = array(
 		'titulo' => array(
 				'Obrigatório' => array(
 						'rule' => array('notempty'),
 						'message' => 'Campo titulo é obrigatório',
 						//'allowEmpty' => false,
 						//'required' => false,
 						//'last' => false, // Stop validation after this rule
 						//'on' => 'create', // Limit validation to 'create' or 'update' operations
 				),
 		),
 		'ordem' => array(
 				'Obrigatório' => array(
 						'rule' => array('notempty'),
 						'message' => 'Campo ordem é obrigatório',
 						//'allowEmpty' => false,
 						//'required' => false,
 						//'last' => false, // Stop validation after this rule
 						//'on' => 'create', // Limit validation to 'create' or 'update' operations
 				),
 		),
 		'ano' => array(
 				'Obrigatório' => array(
 						'rule' => array('notempty'),
 						'message' => 'Campo ano é obrigatório',
 						//'allowEmpty' => false,
 						//'required' => false,
 						//'last' => false, // Stop validation after this rule
 						//'on' => 'create', // Limit validation to 'create' or 'update' operations
 				),
 		),
 		'dimensao_id' => array(
 				'Obrigatório' => array(
 						'rule' => array('notempty'),
 						'message' => 'Campo dimensão é obrigatório',
 						//'allowEmpty' => false,
 						//'required' => false,
 						//'last' => false, // Stop validation after this rule
 						//'on' => 'create', // Limit validation to 'create' or 'update' operations
 				),
 		),
		'status_medida' => array(
 				'Obrigatório' => array(
 						'rule' => array('notempty'),
 						'message' => 'Campo dimensão é obrigatório',
 						//'allowEmpty' => false,
 						//'required' => false,
 						//'last' => false, // Stop validation after this rule
 						//'on' => 'create', // Limit validation to 'create' or 'update' operations
 				),
 		)
 );
 
 //The Associations below have been created with all possible keys, those that are not needed can be removed
 
 /**
  * belongsTo associations
  *
  * @var array
 */
 public $belongsTo = array(
 		'Dimensao' => array(
 				'className' => 'Dimensao',
 				'foreignKey' => 'dimensao_id',
 				'conditions' => '',
 				'fields' => '',
 				'order' => ''
 		),
 );
 
 /**
  * hasMany associations
  *
  * @var array
 */
 public $hasMany = array(
 		'PlanoAcao' => array(
 				'className' => 'PlanoAcao',
 				'foreignKey' => 'objetivo_id',
 				'dependent' => false,
 				'conditions' => '',
 				'fields' => '',
 				'order' => '',
 				'limit' => '',
 				'offset' => '',
 				'exclusive' => '',
 				'finderQuery' => '',
 				'counterQuery' => ''
 		),
 		'Indicador' => array(
 				'className' => 'Indicador',
 				'foreignKey' => 'objetivo_id',
 				'dependent' => false,
 				'conditions' => '',
 				'fields' => '',
 				'order' => '',
 				'limit' => '',
 				'offset' => '',
 				'exclusive' => '',
 				'finderQuery' => '',
 				'counterQuery' => ''
 		),
 		'Acao' => array(
 				'className' => 'Acao',
 				'foreignKey' => 'objetivo_id',
 				'dependent' => false,
 				'conditions' => '',
 				'fields' => '',
 				'order' => '',
 				'limit' => '',
 				'offset' => '',
 				'exclusive' => '',
 				'finderQuery' => '',
 				'counterQuery' => ''
 		)
 );
	public function beforeSave($options = array())
{
    if(!parent::beforeSave($options))
    {
        return false;
    }

    if(!empty($this->data[$this->alias]['situacao_desc']))
    {
        $this->data[$this->alias]['situacao_desc'] = strip_tags($this->data[$this->alias]['situacao_desc']);
    }
	
	if(!empty($this->data[$this->alias]['resultado']))
    {
        $this->data[$this->alias]['resultado'] = strip_tags($this->data[$this->alias]['resultado']);
    }
	
	if(!empty($this->data[$this->alias]['providencia']))
    {
        $this->data[$this->alias]['providencia'] = strip_tags($this->data[$this->alias]['providencia']);
    }
	
	if(!empty($this->data[$this->alias]['restricao']))
    {
        $this->data[$this->alias]['restricao'] = strip_tags($this->data[$this->alias]['restricao']);
    }
	
	if(!empty($this->data[$this->alias]['data_ultima_atualizacao']))
	{
		$this->data[$this->alias]['data_ultima_atualizacao'] = Util::inverteData($this->data[$this->alias]['data_ultima_atualizacao']);
	}
	
	if(!empty($this->data[$this->alias]['data_ultima_revisao']))
	{
		$this->data[$this->alias]['data_ultima_revisao'] = Util::inverteData($this->data[$this->alias]['data_ultima_revisao']);
	}

    return true;
}
	public function afterFind($results){
		foreach($results as $key=>$model){
			if(isset($model["Medida"])){
				if(isset($model['Medida']['data_ultima_atualizacao'])){
					$results[$key]['Medida']['data_ultima_atualizacao'] = Util::inverteData($model['Medida']['data_ultima_atualizacao']);
				}
				if(isset($model['Medida']['data_ultima_revisao'])){
					$results[$key]['Medida']['data_ultima_revisao'] = Util::inverteData($model['Medida']['data_ultima_revisao']);
				}	
			}
			
		}
		return $results;
	}
}
