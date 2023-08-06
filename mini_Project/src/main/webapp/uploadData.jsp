<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background-color: #123345;
	font-size: large;
	color: whitesmoke;
	
}

h1 {
	color: greenyellow;
}
table{
margin-right:auto;
margin-left:auto;
}

td {
	height: 35px;
}
</style>
</head>
<body>
	<%
	String username = (String)request.getAttribute("username");
	%>
	<div class="page">
		<h1 align="center">Upload user data</h1>
		<form action="UploadData" method="post" enctype="multipart/form-data">
			<table >
				<tr>
					<td>First Name</td>
					<td>:</td>
					<td><input type="text" name="fistname" id=""
						placeholder="First Name" required></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td>:</td>
					<td><input type="text" name="lastname" id=""
						placeholder="Last Name" required></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td>:</td>
					<td><input type="radio" id="male" name="gender" value="M"
						required>   <label for="male" style="margin: -11px;">Male</label>&ensp;
						  <input type="radio" id="female" name="gender" value="F" required>
						  <label for="female" style="margin: -11px;">Female</label></td>
				</tr>
				<tr>
					<td>Roll Number</td>
					<td>:</td>
					<td><input type="text" name="rollnumber" id=""
						placeholder="Rollnumber" value="<%=username%>" disabled required></td>
				</tr>
				<tr>
					<td>Batch</td>
					<td>:</td>
					<td><select name="batch" id="batch" required>
							<option value="">select</option>
							<option value="A1">A1</option>
							<option value="A2">A2</option>
							<option value="A3">A3</option>
							<option value="A4">A4</option>
							<option value="A5">A5</option>
							<option value="A6">A6</option>
					</select></td>
				</tr>
				<tr>
					<td>Project Type</td>
					<td>:</td>
					<td><select name="projectType" id="projectType" required>
							<option value="">select</option>
							<option value="Main">Main</option>
							<option value="mini">Mini</option>
					</select></td>
				</tr>
				<tr>
					<td>Role</td>
					<td>:</td>
					<td><select name="role" id="role" required>
							<option value="">select</option>
							<option value="leader">Leader</option>
							<option value="member">Member</option>
					</select></td>
				</tr>
				<tr>
					<td>Poject name</td>
					<td>:</td>
					<td><input type="text" name="projectname" id=""
						placeholder="Project Name" required></td>
				</tr>
				<tr>
					<td>Incharge Name</td>
					<td>:</td>
					<td><input type="text" name="inchargename" id=""
						placeholder="Incharge Name" required></td>
				</tr>
				<tr>
					<td>Guide Name</td>
					<td>:</td>
					<td><input type="text" name="guidename" id=""
						placeholder="Guide Name" required></td>
				</tr>
				<tr>
					<td>HOD Name</td>
					<td>:</td>
					<td><input type="text" name="hodName" id=""
						placeholder="HOD Name" required></td>
				</tr>
				<tr>
					<td><label for="file-upload">Upload Image</label></td>
					<td>:</td>
					<td><div class="preview">
							<img id="preview-selected-image" width="160" height="200" /><br>

							<input type="file" id="file-upload" name="image" accept="image/*"
								onchange="previewImage(event);" required />
						</div></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td><input type="submit" value="Submit"></td>
				</tr>
			</table>
		</form>
	</div>
	<script>
        const previewImage = (event) => {
           
            const imageFiles = event.target.files;
            const imageFilesLength = imageFiles.length;
            if (imageFilesLength > 0) {
                const imageSrc = URL.createObjectURL(imageFiles[0]);
                const imagePreviewElement = document.querySelector("#preview-selected-image");
                imagePreviewElement.src = imageSrc;
                imagePreviewElement.style.display = "block";
            }
        };
    </script>
</body>
</html>