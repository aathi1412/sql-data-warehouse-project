--=========================================
--Create Stored Procedure 
-- Load from CSV file to bronze table using BULK INSERT
-- source CRM, ERP - CSV file
--==========================================



create or alter procedure bronze.load_bronze as
begin
	begin try
	declare @start_time datetime, @end_time datetime, @batch_start_time datetime, @batch_end_time datetime;
	set @batch_start_time = getdate();

		print '============================================';
		print 'Loading Bronze ayer.........';
		print '============================================';

		print '--------------------------------------------';
		print 'Loading CRM Tables';
		print '--------------------------------------------';

		set @start_time = getdate();
		print '>> Truncating  Table: bronze.crm_cust_info';
		truncate table bronze.crm_cust_info;

		print '>> Inserting  Table: bronze.crm_cust_info';
		bulk insert bronze.crm_cust_info
		from 'C:\Users\aathi\Downloads\sql-server setup\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = getdate();
		print '>> Load Duration: ' + cast(datediff(second, @start_time, @end_time) as varchar);

		set @start_time = getdate();
		print '>> Truncating  Table: bronze.crm_prd_info';
		truncate table bronze.crm_prd_info;

		print '>> Inserting  Table: bronze.crm_prd_info';
		bulk insert bronze.crm_prd_info
		from 'C:\Users\aathi\Downloads\sql-server setup\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = getdate();
		print '>> Load Duration: ' + cast(datediff(second, @start_time, @end_time) as varchar);

		set @start_time = getdate();
		print '>> Truncating  Table: bronze.crm_sales_details';
		truncate table bronze.crm_sales_details;

		print '>> Inserting  Table: bronze.crm_sales_details';
		bulk insert bronze.crm_sales_details
		from 'C:\Users\aathi\Downloads\sql-server setup\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = getdate();
		print '>> Load Duration: ' + cast(datediff(second, @start_time, @end_time) as varchar);

		print '--------------------------------------------';
		print 'Loading ERP Tables';
		print '--------------------------------------------';

		set @start_time = getdate();
		print '>> Truncating  Table: bronze.erp_loc_a101';
		truncate table bronze.erp_loc_a101;

		print '>> Inserting  Table: bronze.erp_loc_a101';
		bulk insert bronze.erp_loc_a101
		from 'C:\Users\aathi\Downloads\sql-server setup\sql-data-warehouse-project-main\datasets\source_erp\LOC_A101.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = getdate();
		print '>> Load Duration: ' + cast(datediff(second, @start_time, @end_time) as varchar);

		set @start_time = getdate();
		print '>> Truncating  Table: bronze.erp_loc_az12';
		truncate table bronze.erp_loc_az12;

		print '>> Inserting  Table: bronze.erp_loc_az12';
		bulk insert bronze.erp_loc_az12
		from 'C:\Users\aathi\Downloads\sql-server setup\sql-data-warehouse-project-main\datasets\source_erp\CUST_AZ12.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = getdate();
		print '>> Load Duration: ' + cast(datediff(second, @start_time, @end_time) as varchar);

		set @start_time = getdate();
		print '>> Truncating  Table: bronze.erp_px_cat_g1v2';
		truncate table bronze.erp_px_cat_g1v2;

		print '>> Inserting  Table: bronze.erp_px_cat_g1v2';
		bulk insert bronze.erp_px_cat_g1v2
		from 'C:\Users\aathi\Downloads\sql-server setup\sql-data-warehouse-project-main\datasets\source_erp\PX_CAT_G1V2.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = getdate();
		print '>> Load Duration: ' + cast(datediff(second, @start_time, @end_time) as varchar);
		set @batch_end_time = getdate();
		print '>> Load Duration: ' + cast(datediff(second, @batch_start_time, @batch_end_time) as varchar);
	end try
	
	begin catch
		print '=============================================';
		print 'Error Message' + error_message();
		print 'Error Message' + cast(error_number() as nvarchar);
		print 'Error Message' + cast(error_state() as nvarchar);
		print '=============================================';
	end catch
end

--exec bronze.load_bronze
