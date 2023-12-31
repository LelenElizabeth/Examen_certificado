<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es" xmlns:th="http://www.thymeleaf.org">
<head>
	<meta charset="UTF-8">
	<title>Clinica</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>

	<div class="container mt-5">
		<h1>Historia Cl�nica</h1>
	
		<form th:action="@{/buscar}" method="get">
			<div class="form-group">
				<label for="parametro">Buscar Paciente por Id o Nombre:</label>
				<input type="text" id="parametro" name="parametro" class="form-control" placeholder="Ingrese Id o Nombre">
			</div>
			<button type="submit" class="btn btn-primary">Buscar</button>
		</form>
	
		<div th:if="${pacientes != null and pacientes.size() > 0}">
			<h2 class="mt-4">Pacientes Encontrados:</h2>
			<ul class="list-group mt-3">
				<li th:each="paciente : ${pacientes}" class="list-group-item">
					<a th:href="@{/historia(pacienteId=${paciente.id}, parametro=${parametroIngresado})}" th:text="${paciente.nombre}"></a>
				</li>
			</ul>
		</div>
		
		
		<div th:if="${historiasClinicas != null and historiasClinicas.size() > 0}">
			<h2 class="mt-4">Historia Cl�nica de <span th:text="${pacientes[0].nombre}"></span>:</h2>
			<ul class="list-group mt-3">
				<li th:each="historia : ${historiasClinicas}" class="list-group-item">
					<div class="row">
						<div class="col-md-6">
							<strong>Fecha:</strong> <span th:text="${historia.fechaCita}"></span><br>
							<strong>M�dico:</strong> <span th:text="${historia.doctorId}"></span><br>
							<strong>S�ntomas:</strong> <span th:text="${historia.sintomas}"></span><br>
							<strong>Diagn�stico:</strong> <span th:text="${historia.diagnostico}"></span><br>
							<strong>Tratamiento:</strong> <span th:text="${historia.tratamiento}"></span>
						</div>
						<div class="col-md-6">
							<button class="btn btn-secondary">Editar</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
	
	
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>

</body>
</html>