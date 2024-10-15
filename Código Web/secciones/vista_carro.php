<?php include('../templates/cabecera.php'); ?>

<div class="col-md-5">
    <div class="card">
        <div class="card-header">Carros</div>
        <div class="card-body">
            <div class="mb-3">
                <label for="" class="form-label">Código</label>
                <input
                    type="text"
                    class="form-control"
                    name=""
                    id="id"
                    aria-describedby="helpId"
                    placeholder="Código"
                />
                <small id="helpId" class="form-text text-muted">Help text</small>
            </div>
            <div class="mb-3">
                <label for="" class="form-label">Descripción</label>
                <input
                    type="text"
                    class="form-control"
                    name="nombre_carro"
                    id="nombre_carro"
                    aria-describedby="helpId"
                    placeholder="Descripción del Carro"
                />
                <small id="helpId" class="form-text text-muted">Help text</small>
            </div>

            <div class="btn-group" role="group" aria-label="Button group name">
                <button
                    type="button"
                    class="btn btn-success"
                >
                    Agregar
                </button>
                <button
                    type="button"
                    class="btn btn-warning"
                >
                    Editar
                </button>
                <button
                    type="button"
                    class="btn btn-danger"
                
                >
                    Borrar
                </button>
            </div>
        </div>
    </div>
</div>
<div class="col-md-7">
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Codigo</th>
                    <th scope="col">Descripción</th>
                    <th scope="col">Acciones</th>
                </tr>
            </thead>
            <tbody>
                
                <tr class="">
                    <td> 1 </td>
                    <td>Descripción del Carro</td>
                    <td>Seleccionar</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>


<?php include('../templates/pie.php'); ?>