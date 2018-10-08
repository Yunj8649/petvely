<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Dashboard</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-heading">
				    Pie Chart Example
				</div>
				<div class="panel-body">
					<div class="flot-chart">
						<div class="flot-chart-content" id="flot-pie-chart"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					Multiple Axes Line Chart Example
				</div>
				<div class="panel-body">
					<div class="flot-chart">
						<div class="flot-chart-content" id="flot-line-chart-multi"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					Bar Chart Example
				</div>
				<div class="panel-body">
					<div class="flot-chart">
						<div class="flot-chart-content" id="flot-bar-chart"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<!-- Flot Charts JavaScript -->
<script src="./admin/vendor/flot/excanvas.min.js"></script>
<script src="./admin/vendor/flot/jquery.flot.js"></script>
<script src="./admin/vendor/flot/jquery.flot.pie.js"></script>
<script src="./admin/vendor/flot/jquery.flot.resize.js"></script>
<script src="./admin/vendor/flot/jquery.flot.time.js"></script>
<script src="./admin/vendor/flot-tooltip/jquery.flot.tooltip.min.js"></script>
<script src="./admin/data/flot-data.js"></script>
