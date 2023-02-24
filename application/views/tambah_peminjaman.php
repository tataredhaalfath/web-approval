<!-- Main content -->
<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-header bg-light">
            <div class="text-center">
              <h3 class="">FORM PEMINJAMAN DATA PUSAT</h3>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <form action="#" id="form" class="form-horizontal">
              <input type="hidden" value="" name="id" />
              <div class="card-body">
                <div class="form-group row ">
                  <div class="col col-sm-6 col-md-4 col-lg-4 col-lg-4">
                    <div class="kosong">
                      <input type="text" class="form-control" name="nama" id="nama" placeholder="Kepada">
                    </div>
                  </div>
                  <div class="col col-sm-6 col-md-4 col-lg-4 col-lg-4">
                    <div class="kosong">
                      <input type="text" class="form-control" name="date" id="date" placeholder="Tanggal" readonly value="<?= date('d/m/Y') ?>">
                    </div>
                  </div>
                </div>
                <div class="form-group row ">
                  <div class="col col-sm-6 col-md-4 col-lg-4 col-lg-4">
                    <div class="kosong">
                      <input type="text" class="form-control" name="from" id="from" placeholder="Dari">
                    </div>
                  </div>
                  <div class="col col-sm-6 col-md-4 col-lg-4 col-lg-4">
                    <div class="kosong">
                      <input type="text" class="form-control" name="number" id="number" placeholder="Nomor" readonly value="<?= date('m') ?>/PB/X/<?= date('y') ?>">
                    </div>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col col-10 ml-auto">
                    <p>Dengan ini mengajukan permohonan pemakaian stock barang dari <span id="">XXXXXX-XXXXXX-XXXXXX</span></p>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12 mr-auto">
                    <div class="table-responsive">
                      <table class="table" id="dynamic">
                        <tr>
                          <td><input type="text" class="form-control" value="No. 1" disabled></td>
                          <td><input type="text" name="name[1]" placeholder="Nama Barang" class="form-control" /></td>
                          <td><input type="text" name="qty[1]" placeholder="QTY" class="form-control" /></td>
                          <td><input type="text" name="satuan[1]" placeholder="Harga Satuan" class="form-control" /></td>
                          <td><input type="text" name="total[1]" placeholder="Total" class="form-control" /></td>
                          <td><input type="text" name="maks[1]" placeholder="Maks Delivery" class="form-control" /></td>
                          <td><button type="button" id="tambah" class="btn btn-success">Add</button></td>
                        </tr>
                      </table>
                    </div>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col col-sm-6 col-md-4 col-lg-4 col-lg-4">
                    <div class="kosong">
                      <input type="text" class="form-control" name="closingdate" id="closingdate" placeholder="Tanggal maksimal closing">
                    </div>
                  </div>
                  <div class="col col-sm-6 col-md-4 col-lg-4 col-lg-4">
                    <div class="kosong">
                      <input type="text" class="form-control" name="note" id="note" placeholder="catatan">
                    </div>
                  </div>
                </div>
                <div class="form-group row mt-5">
                  <a href="<?=base_url('peminjaman')?>" class="btn btn-danger ml-auto mr-3" data-dismiss="modal">Cancel</a>
                  <button type="button" id="btnSave" onclick="save()" class="btn btn-primary">Save</button>
                </div>
              </div>
            </form>
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </div>
  <!-- /.container-fluid -->
</section>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
  $(document).ready(function() {

    var no = 1;
    $('#tambah').click(function() {
      no++;
      $('#dynamic').append('<tr id="row' + no + '"> <td><input type="text" value="No. ' + no + '" class="form-control" readonly></td> <td><input type="text" name="name[' + no + ']" placeholder="Masukkan Nama" class="form-control" /></td> <td><input type="text" placeholder="QTY" name="qty[' + no + ']" class="form-control" /></td> <td><input type="text" placeholder="Harga Satuan" name="satuan[' + no + ']" class="form-control" /></td> <td><input type="text" placeholder="Total" name="total[' + no + ']" class="form-control" /></td> <td><input type="text" placeholder="Maks Delivery" name="maks[' + no + ']" class="form-control" /></td> <td> <button type="button" id="' + no + '" class="btn btn-danger btn_remove">Hapus</button></td></tr>');
    });

    $(document).on('click', '.btn_remove', function() {
      var button_id = $(this).attr("id");
      $('#row' + button_id + '').remove();
    });
  });
</script>