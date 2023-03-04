<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Cabang extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model(array('Mod_cabang'));
    }

    public function index()
    {
        $this->load->helper('url');
        $this->template->load('layoutbackend', 'cabang');
    }

    public function ajax_list()
    {
        ini_set('memory_limit', '512M');
        set_time_limit(3600);
        $list = $this->Mod_cabang->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $cbg) {
            $no++;
            $row = array();
            $row[] = $cbg->nama_cabang;
            $data[] = $row;
        }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->Mod_cabang->count_all(),
            "recordsFiltered" => $this->Mod_cabang->count_filtered(),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
    }

    public function insert()
    {
        $this->_validate();
        $save  = array(
            'nama_cabang'            => $this->input->post('nama_cabang'),
        );
        $this->Mod_cabang->insert_cabang("cabang", $save);
        echo json_encode(array("status" => TRUE));
    }

    public function update()
    {
        $this->_validate();
        $id_cabang      = $this->input->post('id_cabang');
        $save  = array(
            'nama_cabang' => $this->input->post('nama_cabang'),
        );
        $this->Mod_cabang->update_cabang($id_cabang, $save);
        echo json_encode(array("status" => TRUE));
    }

    public function edit_cabang($id_cabang)
    {
        $data = $this->Mod_cabang->get_cabang($id_cabang);
        echo json_encode($data);
    }

    public function delete()
    {
        $id_cabang = $this->input->post('id_cabang');
        $this->Mod_cabang->delete_cabang($id_cabang, 'cabang');
        echo json_encode(array("status" => TRUE));
    }
    private function _validate()
    {
        $data = array();
        $data['error_string'] = array();
        $data['inputerror'] = array();
        $data['status'] = TRUE;

        if ($this->input->post('nama_cabang') == '') {
            $data['inputerror'][] = 'nama_cabang';
            $data['error_string'][] = 'Nama Cabang Tidak Boleh Kosong';
            $data['status'] = FALSE;
        }

        if ($data['status'] === FALSE) {
            echo json_encode($data);
            exit();
        }
    }
}
