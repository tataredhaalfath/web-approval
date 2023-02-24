<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Peminjaman extends MY_Controller
{
  function __construct()
  {
    parent::__construct();
    $this->load->model('Mod_peminjaman');
    $this->load->model('Mod_userpeminjaman');
    $this->load->model('Mod_barangpeminjaman');
  }

  public function index()
  {
    $this->template->load('layoutbackend', 'peminjaman');
  }

  public function add(){
    $this->template->load('layoutbackend', 'tambah_peminjaman');
  }
}
