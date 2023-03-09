<?php
class Kategori extends CI_Controller{

    public function elektronik(){
        $data['elektronik'] = $this->model_kategori->data_elektronik()->result();
        $this->load->view('templates/header');
        $this->load->view('templates/sidebar');
        $this->load->view('elektronik',$data);
        $this->load->view('templates/footer');
        
    }

    public function perabotan(){
        $data['perabotan'] = $this->model_kategori->data_perabotan()->result();
        $this->load->view('templates/header');
        $this->load->view('templates/sidebar');
        $this->load->view('perabotan',$data);
        $this->load->view('templates/footer');
        
    }

    public function dekorasi_rumah(){
        $data['dekorasi_rumah'] = $this->model_kategori->data_dekorasi_rumah()->result();
        $this->load->view('templates/header');
        $this->load->view('templates/sidebar');
        $this->load->view('dekorasi_rumah',$data);
        $this->load->view('templates/footer');
        
    }

    public function tekstil(){
        $data['tekstil'] = $this->model_kategori->data_tekstil()->result();
        $this->load->view('templates/header');
        $this->load->view('templates/sidebar');
        $this->load->view('tekstil',$data);
        $this->load->view('templates/footer');
        
    }

    public function produk_luar_ruangan(){
        $data['produk_luar_ruangan'] = $this->model_kategori->data_produk_luar_ruangan()->result();
        $this->load->view('templates/header');
        $this->load->view('templates/sidebar');
        $this->load->view('produk_luar_ruangan',$data);
        $this->load->view('templates/footer');
        
    }
}