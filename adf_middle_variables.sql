-- Datafactory 에서 db를 선택해 아래 쿼리를 날리면 데이터세트로 변환돼어 소스로 치환할 수 있음


-- Sample Query
SELECT '@{pipeline().DataFactory}' as DataFactory_Name,
'@{pipeline().Pipeline}' as Pipeline_Name,
'@{pipeline().RunId}' as RunId,
'TotalSaleTable' as Source1,
'TotalSale CSV File' as Destination,
'@{activity('Dataflow_test').output.runStatus.metrics.sink1.stages[0].bytesRead}' as RowsRead

 
-- FAILURE
select '@{pipeline().DataFactory}' as DataFatory_name,
'@{pipeline().Pipeline}' as Pipeline_Name,
'@{pipeline().RunId}' as RunId,
'your_Source_Name' as Source_Name,
'your_Sink_Name' as Sink_Name,
'@{activity('your_copyOrFlow_name').input.source.wildcardFileName}' as filename, 
'@{activity('your_copyOrFlow_name').output.executionDetails[0].status}' as Execution_Status, 
'@{utcnow()}' as ErrorLoggedTime  


-- SUCCESS
select '@{pipeline().DataFactory}' as DataFatory_name,
'@{pipeline().Pipeline}' as Pipeline_Name,
'@{pipeline().RunId}' as RunId,
'your_Source_Name' as Source_Name,
'your_Sink_Name' as Sink_Name,
'@{activity('your_copyOrFlow_name').input.source.wildcardFileName}' as filename,
'@{activity('your_copyOrFlow_name').output.filesRead}' as dir_file_cnt,
'@{activity('your_copyOrFlow_name').output.rowsRead}' as row_count,
'@{activity('your_copyOrFlow_name').output.rowsCopied}' as RowsCopied,
'@{activity('your_copyOrFlow_name').output.dataRead}' as dataRead,
'@{activity('your_copyOrFlow_name').output.dataWritten}' as dataWritten,
'@{utcnow()}' as reg_dt


-- 변수 설정 하여 아래와 같은 형식으로 
select '@{pipeline().DataFactory}' as DataFatory_name,
'@{pipeline().Pipeline}' as Pipeline_Name,
'@{pipeline().RunId}' as RunId,
'your_Source_Name' as Source_Name,
'your_Sink_Name' as Sink_Name,
'@{variables('your_copyOrFlow_name_Variables')[0]}' as filename,
'@{variables('your_copyOrFlow_name_Variables')[1]}' as dir_file_cnt,
'@{variables('your_copyOrFlow_name_Variables')[2]}' as row_count,
'@{variables('your_copyOrFlow_name_Variables')[3]}' as RowsCopied,
'@{variables('your_copyOrFlow_name_Variables')[4]}' as dataRead,
'@{variables('your_copyOrFlow_name_Variables')[5]}' as dataWritten,
'@{variables('your_copyOrFlow_name_Variables')[6]}' as reg_dt,



