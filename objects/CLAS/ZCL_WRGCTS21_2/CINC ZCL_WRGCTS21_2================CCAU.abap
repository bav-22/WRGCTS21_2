class lcl_Wrgcts21_2_Tst definition deferred.
class zcl_Wrgcts21_2 definition local friends lcl_Wrgcts21_2_Tst.

class lcl_Wrgcts21_2_Tst definition for testing
  duration short
  risk level harmless
.
*?﻿<asx:abap xmlns:asx="http://www.sap.com/abapxml" version="1.0">
*?<asx:values>
*?<TESTCLASS_OPTIONS>
*?<TEST_CLASS>lcl_Wrgcts21_2_Tst
*?</TEST_CLASS>
*?<TEST_MEMBER>f_Cut
*?</TEST_MEMBER>
*?<OBJECT_UNDER_TEST>ZCL_WRGCTS21_2
*?</OBJECT_UNDER_TEST>
*?<OBJECT_IS_LOCAL/>
*?<GENERATE_FIXTURE/>
*?<GENERATE_CLASS_FIXTURE/>
*?<GENERATE_INVOCATION/>
*?<GENERATE_ASSERT_EQUAL>X
*?</GENERATE_ASSERT_EQUAL>
*?</TESTCLASS_OPTIONS>
*?</asx:values>
*?</asx:abap>
  private section.
    data:
      f_Cut type ref to zcl_Wrgcts21_2.  "class under test

    methods: sum for testing.
endclass.       "lcl_Wrgcts21_2_Tst


class lcl_Wrgcts21_2_Tst implementation.

  method sum.
    DATA: lo_object TYPE REF TO zcl_wrgcts21_2,
          lv_result TYPE i.

    CREATE OBJECT lo_object.
    lv_result = lo_object->sum( 3 ).
    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = 6
      msg = '6 expected, but was no received'
    ).
  endmethod.




endclass.