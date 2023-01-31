
<!-- Main content -->
<section class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-header bg-light">
						<h3 class="card-title"><i class="fa fa-list text-blue"></i> List Cabang</h3>
						<div class="text-right">
							<button type="button" class="btn btn-sm btn-outline-primary" onclick="add_cabang()" title="Add Data"><i class="fas fa-plus"></i> Tambah Cabang</button>
						</div>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<table id="tbl_cabang" class="table table-bordered table-striped table-hover">
							<thead>
								<tr class="bg-info">
									<th>Nama Cabang</th>
									<th>Kepala Cabang</th>
									<th>Aksi</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
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


<script type="text/javascript">
var save_method; //for save method string
var table;

$(document).ready(function() {

    //datatables
    table =$("#tbl_cabang").DataTable({
    	"responsive": true,
    	"autoWidth": false,
    	"language": {
    		"sEmptyTable": "Data Cabang Belum Ada"
    	},
        "processing": true, //Feature control the processing indicator.
        "serverSide": true, //Feature control DataTables' server-side processing mode.
        "order": [], //Initial no order.

        // Load data for the table's content from an Ajax source
        "ajax": {
        	"url": "<?php echo site_url('cabang/ajax_list')?>",
        	"type": "POST"
        },
         //Set column definition initialisation properties.
         "columnDefs": [
         { 
            "targets": [ -1 ], //last column
            "render": function ( data, type, row ) {

            	return "<a class=\"btn btn-xs btn-outline-primary\" href=\"javascript:void(0)\" title=\"Edit\" onclick=\"edit_cabang("+row[4]+")\"><i class=\"fas fa-edit\"></i></a><a class=\"btn btn-xs btn-outline-danger\" href=\"javascript:void(0)\" title=\"Delete\" nama_cabang="+row[0]+"  onclick=\"del_cabang("+row[4]+")\"><i class=\"fas fa-trash\"></i></a>";

            },

            "orderable": false, //set not orderable
        },

        ],
    });

 //set input/textarea/select event when change value, remove class error and remove text help block 
 $("input").change(function(){
 	$(this).parent().parent().removeClass('has-error');
 	$(this).next().empty();
 	$(this).removeClass('is-invalid');
 });
 $("textarea").change(function(){
 	$(this).parent().parent().removeClass('has-error');
 	$(this).next().empty();
 	$(this).removeClass('is-invalid');
 });
 $("select").change(function(){
 	$(this).parent().parent().removeClass('has-error');
 	$(this).next().empty();
 	$(this).removeClass('is-invalid');
 });

});

function reload_table()
{
    table.ajax.reload(null,false); //reload datatable ajax 
}

const Toast = Swal.mixin({
	toast: true,
	position: 'top-end',
	showConfirmButton: false,
	timer: 3000
});


//delete
function del_cabang(id){

    Swal.fire({
  title: 'Yakin ingin menghapus data ini ?',
  text: "Data tidak dapat dipulihkan setelah dihapus",
  icon: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Ya, Hapus Data!'
}).then((result) => {

        $.ajax({
        url:"<?php echo site_url('cabang/delete');?>",
        type:"POST",
        data:"id_cabang="+id,
        cache:false,
         dataType: 'json',
        success:function(respone){
        if (respone.status == true) {
            reload_table();
        Swal.fire(
          'Terhapus!',
          'Data telah dihapus dari sistem.',
          'Sukses!'
        );
        }else{
          Toast.fire({
                  icon: 'Error',
                  title: 'Delete Error!!.'
                });
        }
        }
    });
})
}



function add_cabang()
{
    save_method = 'add';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form').modal({backdrop: 'static', keyboard: false}); // show bootstrap modal
    $('.modal-title').text('Add Barang'); // Set Title to Bootstrap modal title
}

function edit_cabang(id_cabang){
	save_method = 'update';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string

    //Ajax Load data from ajax
    $.ajax({
    	url : "<?php echo site_url('cabang/edit_cabang')?>/" + id_cabang,
    	type: "GET",
    	dataType: "JSON",
    	success: function(data)
    	{

    		$('[name="id_cabang"]').val(data.id_cabang);
    		$('[name="nama_cabang"]').val(data.nama_cabang);
    		$('[name="kepala_cabang"]').val(data.kepala_cabang);
            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Cabang'); // Set title to Bootstrap modal title

        },
        error: function (jqXHR, textStatus, errorThrown)
        {
        	alert('Error get data from ajax');
        }
    });
}

function save()
{
    $('#btnSave').text('Menyimpan...'); //change button text
    $('#btnSave').attr('disabled',true); //set button disable 
    if(save_method == 'add') {
        url = "<?php echo site_url('cabang/insert')?>";
    } else {
        url = "<?php echo site_url('cabang/update')?>";
    }
   
    // ajax adding data to database
    $.ajax({
    	url : url,
    	type: "POST",
    	data: $('#form').serialize(),
    	dataType: "JSON",
    	success: function(data)
    	{

            if(data.status) //if success close modal and reload ajax table
            {
            	$('#modal_form').modal('hide');
            	reload_table();
            	Toast.fire({
            		icon: 'success',
            		title: 'Success!!.'
            	});
            }
            else
            {
            	for (var i = 0; i < data.inputerror.length; i++) 
            	{
            		$('[name="'+data.inputerror[i]+'"]').addClass('is-invalid');
            		$('[name="'+data.inputerror[i]+'"]').next().text(data.error_string[i]).addClass('invalid-feedback');
            	}
            }
            $('#btnSave').text('save'); //change button text
            $('#btnSave').attr('disabled',false); //set button enable 


        },
        error: function (jqXHR, textStatus, errorThrown)
        {
        	alert('Error adding / update data');
            $('#btnSave').text('save'); //change button text
            $('#btnSave').attr('disabled',false); //set button enable 

        }
    });
}

</script>



<!-- Bootstrap modal -->
<div class="modal fade" id="modal_form" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content ">

			<div class="modal-header">
				<h3 class="modal-title">Form Data</h3>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>

			</div>
			<div class="modal-body form">
				<form action="#" id="form" class="form-horizontal" >
					<input type="hidden" value="" name="id"/> 
					<div class="card-body">
						<div class="form-group row ">
							<label for="nama_cabang" class="col-sm-3 col-form-label">Nama Cabang</label>
							<div class="col-sm-9 kosong">
								<input type="text" class="form-control" name="nama_cabang" id="nama_cabang" placeholder="Nama Cabang" >
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group row ">
							<label for="kepala_cabang" class="col-sm-3 col-form-label">Kepala Cabang</label>
							<div class="col-sm-9 kosong">
								<input type="text" class="form-control"  name="kepala_cabang" id="kepala_cabang" placeholder="Kepala Cabang" >
								<span class="help-block"></span>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="btnSave" onclick="save()" class="btn btn-primary">Save</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- End Bootstrap modal -->