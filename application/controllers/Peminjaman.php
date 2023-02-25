<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Peminjaman extends MY_Controller
{
  function __construct()
  {
    parent::__construct();
    $this->load->model(array('Mod_peminjaman', 'Mod_cabang', 'Mod_userpeminjaman', 'Mod_barangpeminjaman'));
    // $this->load->model('Mod_cabang');
    // $this->load->model('Mod_userpeminjaman');
    // $this->load->model('Mod_barangpeminjaman');
  }

  public function index()
  {
    $this->template->load('layoutbackend', 'peminjaman');
  }

  public function dropdowncabang()
  {
    $cabangs = $this->Mod_cabang->get_cabanglist();
    echo json_encode($cabangs);
  }

  public function add()
  {
    $cabangs = $this->Mod_cabang->get_cabanglist();
    $this->template->load('layoutbackend', 'tambah_peminjaman', $cabangs);
  }

  public function insert()
  {
    $dataPeminjaman = array(
      'id_cabang' => $this->input->post('direction'),
      'from' => $this->input->post('from'),
      'date' => $this->input->post('date'),
      'number' => $this->input->post('number'),
      'closingdate' => $this->input->post('closingDate'),
      'note' => $this->input->post('note'),
    );

    $peminjamanId = $this->Mod_peminjaman->insert_peminjaman('peminjaman', $dataPeminjaman);

    $barang = $this->input->post('barang');
    foreach ($barang as $item) {
      var_dump($item);
      echo ($item['name']);
      $data = array(
        'id_peminjaman' => $peminjamanId,
        'sku' => '',
        'nama' => $item['name'],
        'harga' => $item["price"],
        'qty' => $item["qty"],
        'jumlah' => $item["total"],
        'stok_po' => '',
        'maks_delivery' => $item['maks'],
      );
      $this->Mod_barangpeminjaman->insert_barangpeminjaman('barangpeminjaman', $data);
    }
    echo "Data peminjaman berhasil disimpan";
  }
}
