
<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hms.model.Medicine" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Pharmacy Management</title>

<link rel="preconnect"
href="https://fonts.googleapis.com">

<link rel="preconnect"
href="https://fonts.gstatic.com"
crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="stylesheet"
href="css/style.css">

<style>

.table{

color:white;
}

.table tbody tr{

transition:0.3s ease;
}

.table tbody tr:hover{

background:
rgba(255,255,255,0.06);
}

.stock-good{

padding:8px 14px;

border-radius:12px;

background:
rgba(34,197,94,0.15);

color:#4ade80;

font-size:13px;

font-weight:600;
}

.stock-low{

padding:8px 14px;

border-radius:12px;

background:
rgba(239,68,68,0.18);

color:#f87171;

font-size:13px;

font-weight:600;
}

.search-box{

background:
rgba(255,255,255,0.08);

border:none;

outline:none;

padding:12px 18px;

border-radius:14px;

width:280px;

color:white;
}

.search-box::placeholder{

color:rgba(255,255,255,0.6);
}

</style>

</head>

<body>

<jsp:include page="sidebar.jsp" />

<jsp:include page="topbar.jsp" />

<div class="main-content">

    <div class="page-title">

        Pharmacy Stock Management

    </div>

    <!-- ADD MEDICINE -->

    <div class="glass-card">

        <h4 class="mb-4 fw-bold">

            💊 Add Medicine

        </h4>

        <form action="AddMedicineServlet"
              method="post">

            <div class="row g-4">

                <div class="col-md-6">

                    <input type="text"
                           name="medicineName"
                           class="form-control"
                           placeholder="Medicine Name"
                           required>

                </div>

                <div class="col-md-6">

                    <input type="text"
                           name="category"
                           class="form-control"
                           placeholder="Category"
                           required>

                </div>

                <div class="col-md-6">

                    <input type="number"
                           name="stockQuantity"
                           class="form-control"
                           placeholder="Stock Quantity"
                           required>

                </div>

                <div class="col-md-6">

                    <input type="number"
                           step="0.01"
                           name="price"
                           class="form-control"
                           placeholder="Price"
                           required>

                </div>

                <div class="col-md-12">

                    <button type="submit"
                            class="primary-btn">

                        Add Medicine

                    </button>

                </div>

            </div>

        </form>

    </div>

    <!-- MEDICINE STOCK -->

    <div class="glass-card mt-4">

        <div class="d-flex
                    justify-content-between
                    align-items-center
                    mb-4
                    flex-wrap
                    gap-3">

            <h4 class="fw-bold m-0">

                💉 Medicine Inventory

            </h4>

            <input type="text"
                   id="medicineSearch"
                   class="search-box"
                   placeholder="Search medicine...">

        </div>

        <div class="table-responsive">

        <table class="table table-borderless align-middle">

            <thead>

                <tr>

                    <th>ID</th>
                    <th>Medicine</th>
                    <th>Category</th>
                    <th>Stock</th>
                    <th>Price</th>

                </tr>

            </thead>

            <tbody id="medicineTable">

<%

ArrayList<Medicine> medicines =

(ArrayList<Medicine>)
request.getAttribute(
"medicines");

if(medicines != null){

for(Medicine medicine : medicines){

%>

<tr>

<td>

<%= medicine.getId() %>

</td>

<td class="medicine-name">

<%= medicine.getMedicineName() %>

</td>

<td>

<%= medicine.getCategory() %>

</td>

<td>

<%

if(medicine.getStockQuantity() <= 10){

%>

<span class="stock-low">

Low Stock :
<%= medicine.getStockQuantity() %>

</span>

<%

}

else{

%>

<span class="stock-good">

Available :
<%= medicine.getStockQuantity() %>

</span>

<%

}

%>

</td>

<td>

₹ <%= medicine.getPrice() %>

</td>

</tr>

<%

}

}

else{

%>

<tr>

<td colspan="5"
    class="text-center text-warning">

    No medicines available

</td>

</tr>

<%

}

%>

            </tbody>

        </table>

        </div>

    </div>

</div>

<script>

const medicineSearch =

document.getElementById(
"medicineSearch");

medicineSearch.addEventListener(
"keyup",

function(){

let filter =

medicineSearch.value.toLowerCase();

let rows =

document.querySelectorAll(
"#medicineTable tr");

rows.forEach(row => {

let medicine =

row.querySelector(
".medicine-name");

if(medicine){

let text =

medicine.innerText.toLowerCase();

row.style.display =

text.includes(filter)
? ""
: "none";
}

});

});

</script>

</body>

</html>