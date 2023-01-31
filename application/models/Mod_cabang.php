<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Mod_cabang extends CI_Model
{
	var $table = 'cabang';
	var $column_search = array('nama_cabang','kepala_cabang'); 
	var $column_kcp = array('nama_cabang','kepala_cabang');
	var $kcp = array('id_cabang' => 'desc'); 
	function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

		private function _get_datatables_query()
	{
		
		$this->db->from('cabang');
		$i = 0;

	foreach ($this->column_search as $item) // loop column 
	{
	if($_POST['search']['value']) // if datatable send POST for search
	{

	if($i===0) // first loop
	{
	$this->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND.
	$this->db->like($item, $_POST['search']['value']);
	}
	else
	{
		$this->db->or_like($item, $_POST['search']['value']);
	}

		if(count($this->column_search) - 1 == $i) //last loop
		$this->db->group_end(); //close bracket
	}
	$i++;
	}

		if(isset($_POST['kcp'])) // here kcp processing
		{
			$this->db->kcp_by($this->column_kcp[$_POST['kcp']['0']['column']], $_POST['kcp']['0']['dir']);
		} 
		else if(isset($this->kcp))
		{
			$kcp = $this->kcp;
			$this->db->kcp_by(key($kcp), $kcp[key($kcp)]);
		}
	}

	function get_datatables()
	{
		$this->_get_datatables_query();
		if($_POST['length'] != -1)
			$this->db->limit($_POST['length'], $_POST['start']);
		$query = $this->db->get();
		return $query->result();
	}

	function count_filtered()
	{
		$this->_get_datatables_query();
		$query = $this->db->get();
		return $query->num_rows();
	}

	function count_all()
	{
		$this->db->from('cabang');
		return $this->db->count_all_results();
	}

	function insert_cabang($table, $data)
    {
        $insert = $this->db->insert($table, $data);
        return $insert;
    }

        function update_cabang($id_cabang, $data)
    {
        $this->db->where('id_cabang_cabang', $id_cabang);
        $this->db->update('cabang', $data);
    }

        function get_brg($id_cabang)
    {   
        $this->db->where('id_cabang',$id_cabang);
        return $this->db->get('cabang')->row();
    }

        function delete_brg($id_cabang, $table)
    {
        $this->db->where('id_cabang', $id_cabang);
        $this->db->delete($table);
    }

}