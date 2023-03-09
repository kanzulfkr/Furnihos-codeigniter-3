<?php
class Model_kategori extends CI_Model{
    public function data_elektronik(){
        return $this->db->get_where("tb_barang",array('kategori'=>'elektronik'));
    }

    public function data_perabotan(){
        return $this->db->get_where("tb_barang",array('kategori'=>'perabotan'));
    }

    public function data_dekorasi_rumah(){
        return $this->db->get_where("tb_barang",array('kategori'=>'dekorasi rumah'));
    }

    public function data_tekstil(){
        return $this->db->get_where("tb_barang",array('kategori'=>'tekstil'));
    }

    public function data_produk_luar_ruangan(){
        return $this->db->get_where("tb_barang",array('kategori'=>'produk luar ruangan'));
    }
}