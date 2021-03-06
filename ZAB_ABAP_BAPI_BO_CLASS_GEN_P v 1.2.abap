REPORT zab_abap_bapi_bo_class_gen_p
  LINE-SIZE 999.

*&---------------------------------------------------------------------*
* License agreement
*&---------------------------------------------------------------------*
*
*MIT License
*
*Copyright (c) 2019 Alwin van de Put - SAP developer
*LinkedIn: https://www.linkedin.com/in/alwin-van-de-put-269a29/
*
*Github: https://github.com/alwinvandeput/abap_bapi_bo_class_generator
*SAP blog: https://blogs.sap.com/2019/08/27/abap-bapi-bo-class-generator/
*
*Permission is hereby granted, free of charge, to any person obtaining a copy
*of this software and associated documentation files (the "Software"), to deal
*in the Software without restriction, including without limitation the rights
*to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
*copies of the Software, and to permit persons to whom the Software is
*furnished to do so, subject to the following conditions:
*
*The above copyright notice and this permission notice, including
*the owner name, shall be included in all copies or substantial portions of
*the Software.
*
*THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
*IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
*FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
*AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
*LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
*OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
*SOFTWARE.

*&---------------------------------------------------------------------*
* INSTALLATION MANUAL
*&---------------------------------------------------------------------*
* - T: SE38 -> Create new ABAP program with a name, for example: ZAB_ABAP_BAPI_BO_CLASS_GEN_P
* - Copy and paste all code to the new program.
* - Activate and run the program.

TABLES: sscrfields.


CLASS zab_return_exc DEFINITION
*  public
  INHERITING FROM cx_static_check
  CREATE PROTECTED.

  PUBLIC SECTION.

    TYPES:
      gtt_bdc_messages  TYPE STANDARD TABLE OF bdcmsgcoll WITH DEFAULT KEY.

    TYPES:
      gtt_bapireturn TYPE STANDARD TABLE OF bapireturn WITH DEFAULT KEY.

    TYPES:
      BEGIN OF gts_code_position,
        program_name TYPE syrepid,
        include_name TYPE syrepid,
        source_line  TYPE i,
      END OF gts_code_position.

    METHODS constructor
      IMPORTING
        !textid           LIKE textid OPTIONAL
        !previous         LIKE previous OPTIONAL
        !gt_bapiret2      TYPE bapiret2_t OPTIONAL
        !gs_bapiret2      TYPE bapiret2 OPTIONAL
        !gs_code_position TYPE gts_code_position OPTIONAL.

    CLASS-METHODS create_empty
      RETURNING
        VALUE(rx_return) TYPE REF TO zab_return_exc.

    CLASS-METHODS create_by_system_message
      RETURNING
        VALUE(rx_return) TYPE REF TO zab_return_exc.

    CLASS-METHODS create_by_bapireturn_struc
      IMPORTING
        !is_return       TYPE bapireturn
      RETURNING
        VALUE(rx_return) TYPE REF TO zab_return_exc.

    CLASS-METHODS create_by_bapireturn_table
      IMPORTING
        !it_return          TYPE gtt_bapireturn
        !iv_restartable_ind TYPE abap_bool DEFAULT abap_false
      RETURNING
        VALUE(rx_return)    TYPE REF TO zab_return_exc.

    CLASS-METHODS create_by_bapiret1_struc
      IMPORTING
        !is_return       TYPE bapiret1
      RETURNING
        VALUE(rx_return) TYPE REF TO zab_return_exc.

    CLASS-METHODS create_by_bapiret1_table
      IMPORTING
        !it_return          TYPE bapiret1_tab
        !iv_restartable_ind TYPE abap_bool DEFAULT abap_false
      RETURNING
        VALUE(rx_return)    TYPE REF TO zab_return_exc.

    CLASS-METHODS create_by_bapiret2_struc
      IMPORTING
        !is_return       TYPE bapiret2
      RETURNING
        VALUE(rx_return) TYPE REF TO zab_return_exc.

    CLASS-METHODS create_by_bapiret2_table
      IMPORTING
        !it_return          TYPE bapiret2_t
        !iv_restartable_ind TYPE abap_bool DEFAULT abap_false
      RETURNING
        VALUE(rx_return)    TYPE REF TO zab_return_exc.


    CLASS-METHODS create_by_bdc_message_table
      IMPORTING
        !it_bdc_messages    TYPE gtt_bdc_messages
        !iv_restartable_ind TYPE abap_bool DEFAULT abap_false
      RETURNING
        VALUE(rx_return)    TYPE REF TO zab_return_exc.

    CLASS-METHODS create_by_text
      IMPORTING
        !iv_type         TYPE bapi_mtype DEFAULT 'E'
        !iv_message      TYPE bapi_msg
        !iv_field_name   TYPE bapiret2-field OPTIONAL
        !iv_variable_1   TYPE symsgv OPTIONAL
        !iv_variable_2   TYPE symsgv OPTIONAL
        !iv_variable_3   TYPE symsgv OPTIONAL
        !iv_variable_4   TYPE symsgv OPTIONAL
      RETURNING
        VALUE(rx_return) TYPE REF TO zab_return_exc.

    CLASS-METHODS split_long_value_to_bapiret2
      IMPORTING !iv_type           TYPE bapi_mtype DEFAULT 'E'
                !iv_id             TYPE symsgid
                !iv_number         TYPE symsgno
                !iv_long_value     TYPE char200
      RETURNING VALUE(rs_bapiret2) TYPE bapiret2.

    METHODS get_bapiret2_struc
      RETURNING VALUE(rs_bapiret2) TYPE bapiret2.

    METHODS get_bapiret2_table
      RETURNING VALUE(rt_bapiret2) TYPE bapiret2_t.

    METHODS get_code_position
      RETURNING VALUE(rs_code_position) TYPE gts_code_position.

    METHODS add_system_message.

    METHODS add_bapiret2_struc
      IMPORTING
        !is_return TYPE bapiret2.

    METHODS add_bapiret2_table
      IMPORTING
        !it_return TYPE bapiret2_t.

    METHODS add_bapiret1_struc
      IMPORTING
        !is_bapiret1 TYPE bapiret1.

    METHODS add_bapiret1_table
      IMPORTING
        !it_return TYPE bapiret1_tab.

    METHODS add_bapireturn_struc
      IMPORTING
        !is_bapireturn TYPE bapireturn.

    METHODS add_bapireturn_table
      IMPORTING
        !it_return TYPE gtt_bapireturn.

    METHODS add_by_text
      IMPORTING
        !iv_type       TYPE bapi_mtype DEFAULT 'E'
        !iv_message    TYPE bapi_msg
        !iv_field_name TYPE bapiret2-field OPTIONAL
        !iv_variable_1 TYPE symsgv OPTIONAL
        !iv_variable_2 TYPE symsgv OPTIONAL
        !iv_variable_3 TYPE symsgv OPTIONAL
        !iv_variable_4 TYPE symsgv OPTIONAL.

    CLASS-METHODS map_bapireturn_to_bapiret2
      IMPORTING
        !is_bapireturn     TYPE bapireturn
      RETURNING
        VALUE(rs_bapiret2) TYPE bapiret2.

    CLASS-METHODS map_bapiret1_to_bapiret2
      IMPORTING
        !is_bapiret1       TYPE bapiret1
      RETURNING
        VALUE(rs_bapiret2) TYPE bapiret2.

    CLASS-METHODS set_bapiret2_message_field
      CHANGING cs_bapiret2 TYPE bapiret2.

    CLASS-METHODS map_bdc_mess_to_bapiret2
      IMPORTING
        !is_bdc_message    TYPE bdcmsgcoll
      RETURNING
        VALUE(rs_bapiret2) TYPE bapiret2.

    METHODS raise_exception_for_fm
      RAISING
        zab_return_exc.

    METHODS if_message~get_text
        REDEFINITION.

  PROTECTED SECTION.

    DATA gs_bapiret2 TYPE bapiret2.

    DATA gt_bapiret2 TYPE bapiret2_t.

    DATA gs_code_position TYPE gts_code_position.

  PRIVATE SECTION.

ENDCLASS.

CLASS zab_return_exc IMPLEMENTATION.

  METHOD add_bapiret2_struc.

    IF gs_bapiret2 IS INITIAL OR
       gs_bapiret2-type NA 'EAX'.

      gs_bapiret2 = is_return.

    ENDIF.

    APPEND is_return TO gt_bapiret2.

  ENDMETHOD.

  METHOD add_bapiret2_table.

    LOOP AT it_return
      ASSIGNING FIELD-SYMBOL(<ls_return>).

      add_bapiret2_struc( <ls_return>  ).

    ENDLOOP.

  ENDMETHOD.


  METHOD add_bapireturn_struc.

    DATA(ls_bapiret2) =
      zab_return_exc=>map_bapireturn_to_bapiret2( is_bapireturn ).

    add_bapiret2_struc( ls_bapiret2 ).

  ENDMETHOD.

  METHOD add_bapireturn_table.

    LOOP AT it_return
      ASSIGNING FIELD-SYMBOL(<ls_return>).

      add_bapireturn_struc( <ls_return> ).

    ENDLOOP.

  ENDMETHOD.

  METHOD add_bapiret1_struc.

    DATA(ls_bapiret2) = map_bapiret1_to_bapiret2( is_bapiret1 ).

    add_bapiret2_struc( ls_bapiret2 ).

  ENDMETHOD.

  METHOD add_bapiret1_table.

    LOOP AT it_return
      ASSIGNING FIELD-SYMBOL(<ls_return>).

      add_bapiret1_struc( <ls_return> ).

    ENDLOOP.

  ENDMETHOD.

  METHOD add_by_text.

    "Example:
    "iv_type         = 'e'
    "iv_message      = 'sales order &1 not found.'
    "iv_variable_1   = '100001
    "iv_variable_2   = ''
    "iv_variable_3   = ''
    "iv_variable_4   = ''

    DATA:
      lv_message TYPE bapi_msg,
      ls_return  TYPE bapiret2.

    lv_message = iv_message.

    DO 4 TIMES.


      DATA lv_placeholder_name TYPE c LENGTH 2.
      DATA lv_variable_name TYPE c LENGTH 15.

      lv_placeholder_name  = '&' && sy-index.

      lv_variable_name  = 'iv_variable_' && sy-index.

      ASSIGN (lv_variable_name)
        TO FIELD-SYMBOL(<lv_variable>).

      REPLACE ALL OCCURRENCES OF lv_placeholder_name
        IN lv_message
        WITH <lv_variable>
        IN CHARACTER MODE.

      DATA lv_return_var_name TYPE c LENGTH 15.

      lv_return_var_name = 'MESSAGE_V' && sy-index.

      ASSIGN COMPONENT lv_return_var_name
        OF STRUCTURE ls_return
        TO FIELD-SYMBOL(<lv_return_variable>).

      <lv_return_variable> = <lv_variable>.

    ENDDO.

    ls_return-type    = iv_type.
    ls_return-message = lv_message.
    ls_return-field   = iv_field_name.

    add_bapiret2_struc( ls_return ).

  ENDMETHOD.

  METHOD add_system_message.

    DATA:
      ls_bapiret2 TYPE bapiret2.

    ls_bapiret2-type        = sy-msgty.
    ls_bapiret2-id          = sy-msgid.
    ls_bapiret2-number      = sy-msgno.

    ls_bapiret2-message_v1  = sy-msgv1.
    ls_bapiret2-message_v2  = sy-msgv2.
    ls_bapiret2-message_v3  = sy-msgv3.
    ls_bapiret2-message_v4  = sy-msgv4.

    set_bapiret2_message_field(
      CHANGING cs_bapiret2 = ls_bapiret2 ).

    add_bapiret2_struc( ls_bapiret2 ).

  ENDMETHOD.

  METHOD constructor.

    CALL METHOD super->constructor
      EXPORTING
        textid   = textid
        previous = previous.

    me->gt_bapiret2 = gt_bapiret2.

    me->gs_bapiret2 = gs_bapiret2.

    me->gs_code_position = gs_code_position.

  ENDMETHOD.

  METHOD create_by_bapiret1_struc.

    DATA(ls_bapiret2) = map_bapiret1_to_bapiret2( is_return ).

    rx_return = create_by_bapiret2_struc( ls_bapiret2 ).

  ENDMETHOD.

  METHOD create_by_bapiret2_struc.

    IF is_return-type CA 'XAE'.

      rx_return = NEW #( ).

      rx_return->add_bapiret2_struc( is_return ).

    ENDIF.

  ENDMETHOD.

  METHOD create_by_bapiret2_table.

    DATA:
      lv_error_ind  TYPE abap_bool.

    "Has return table an error?
    LOOP AT it_return ASSIGNING FIELD-SYMBOL(<ls_return>).

      IF <ls_return>-type CA 'XAE'.

        lv_error_ind = abap_true.
        EXIT.

      ENDIF.

    ENDLOOP.

    IF lv_error_ind = abap_true.

*      IF iv_restartable_ind = abap_false.

      rx_return = NEW #( ).

*      ELSE.
*
*        rx_return = NEW zcx_restartable_error( ).
*
*      ENDIF.

      rx_return->add_bapiret2_table( it_return ).

    ENDIF.

  ENDMETHOD.

  METHOD create_by_bapireturn_struc.

    DATA(ls_bapiret2) = map_bapireturn_to_bapiret2( is_return ).

    rx_return = create_by_bapiret2_struc( ls_bapiret2 ).

  ENDMETHOD.

  METHOD create_by_bapireturn_table.

    DATA lt_bapiret2          TYPE bapiret2_t.

    LOOP AT it_return
      ASSIGNING FIELD-SYMBOL(<ls_return>).

      APPEND INITIAL LINE TO lt_bapiret2
        ASSIGNING FIELD-SYMBOL(<ls_bapiret2>).

      <ls_bapiret2> = map_bapireturn_to_bapiret2( <ls_return> ).

    ENDLOOP.

    rx_return =
      zab_return_exc=>create_by_bapiret2_table(
        it_return          = lt_bapiret2
        iv_restartable_ind = iv_restartable_ind ).

  ENDMETHOD.

  METHOD create_by_bapiret1_table.

    DATA:
      lv_error_ind  TYPE abap_bool.

    "Has return table an error?
    LOOP AT it_return ASSIGNING FIELD-SYMBOL(<ls_return>).

      IF <ls_return>-type CA 'XAE'.

        lv_error_ind = abap_true.
        EXIT.

      ENDIF.

    ENDLOOP.

    IF lv_error_ind = abap_true.

*      IF iv_restartable_ind = abap_false.

      rx_return = NEW #( ).

*      ELSE.
*
*        rx_return = NEW zcx_restartable_error( ).
*
*      ENDIF.

      rx_return->add_bapiret1_table( it_return ).

    ENDIF.

  ENDMETHOD.

  METHOD create_by_bdc_message_table.

    DATA lt_bapiret2          TYPE bapiret2_t.

    LOOP AT it_bdc_messages
      ASSIGNING FIELD-SYMBOL(<ls_bdc_message>).

      APPEND INITIAL LINE TO lt_bapiret2
        ASSIGNING FIELD-SYMBOL(<ls_bapiret2>).

      <ls_bapiret2> = map_bdc_mess_to_bapiret2( <ls_bdc_message> ).

    ENDLOOP.

    rx_return =
      zab_return_exc=>create_by_bapiret2_table(
        it_return          = lt_bapiret2
        iv_restartable_ind = iv_restartable_ind ).

  ENDMETHOD.

  METHOD create_empty.

    rx_return = NEW #( ).

  ENDMETHOD.

  METHOD create_by_system_message.

    rx_return = NEW #( ).

    rx_return->add_system_message( ).

  ENDMETHOD.

  METHOD create_by_text.

    rx_return = NEW #( ).

    rx_return->add_by_text(
      iv_type         = iv_type
      iv_message      = iv_message
      iv_field_name   = iv_field_name
      iv_variable_1   = iv_variable_1
      iv_variable_2   = iv_variable_2
      iv_variable_3   = iv_variable_3
      iv_variable_4   = iv_variable_4 ).

  ENDMETHOD.

  METHOD if_message~get_text.

    IF gs_bapiret2-message IS INITIAL.

      set_bapiret2_message_field(
        CHANGING cs_bapiret2 = gs_bapiret2 ).

    ENDIF.

    result = gs_bapiret2-message.

  ENDMETHOD.

  METHOD get_bapiret2_struc.

    rs_bapiret2 = gs_bapiret2.

  ENDMETHOD.

  METHOD get_bapiret2_table.

    rt_bapiret2 = gt_bapiret2.

  ENDMETHOD.

  METHOD get_code_position.

    rs_code_position = gs_code_position.

  ENDMETHOD.

  METHOD map_bapireturn_to_bapiret2.

    rs_bapiret2-type       = is_bapireturn-type.

    "Example value field code: IS504
    rs_bapiret2-id      = is_bapireturn-code+0(2).
    rs_bapiret2-number  = is_bapireturn-code+2(3).

    rs_bapiret2-message    = is_bapireturn-message.
    rs_bapiret2-log_no     = is_bapireturn-log_no.
    rs_bapiret2-log_msg_no = is_bapireturn-log_msg_no.
    rs_bapiret2-message_v1 = is_bapireturn-message_v1.
    rs_bapiret2-message_v2 = is_bapireturn-message_v2.
    rs_bapiret2-message_v3 = is_bapireturn-message_v3.
    rs_bapiret2-message_v4 = is_bapireturn-message_v4.

  ENDMETHOD.

  METHOD map_bapiret1_to_bapiret2.

    rs_bapiret2-type       = is_bapiret1-type.
    rs_bapiret2-id         = is_bapiret1-id.
    rs_bapiret2-number     = is_bapiret1-number.

    rs_bapiret2-message    = is_bapiret1-message.
    rs_bapiret2-log_no     = is_bapiret1-log_no.
    rs_bapiret2-log_msg_no = is_bapiret1-log_msg_no.
    rs_bapiret2-message_v1 = is_bapiret1-message_v1.
    rs_bapiret2-message_v2 = is_bapiret1-message_v2.
    rs_bapiret2-message_v3 = is_bapiret1-message_v3.
    rs_bapiret2-message_v4 = is_bapiret1-message_v4.

  ENDMETHOD.

  METHOD set_bapiret2_message_field.

    MESSAGE
      ID cs_bapiret2-id
      TYPE cs_bapiret2-type
      NUMBER cs_bapiret2-number
      WITH
        cs_bapiret2-message_v1
        cs_bapiret2-message_v2
        cs_bapiret2-message_v3
        cs_bapiret2-message_v4
      INTO cs_bapiret2-message.

  ENDMETHOD.

  METHOD map_bdc_mess_to_bapiret2.

    rs_bapiret2-type       = is_bdc_message-msgtyp.
    rs_bapiret2-id      = is_bdc_message-msgid.
    rs_bapiret2-number  = is_bdc_message-msgnr.

    rs_bapiret2-message_v1 = is_bdc_message-msgv1.
    rs_bapiret2-message_v2 = is_bdc_message-msgv2.
    rs_bapiret2-message_v3 = is_bdc_message-msgv3.
    rs_bapiret2-message_v4 = is_bdc_message-msgv4.

    set_bapiret2_message_field(
      CHANGING cs_bapiret2 = rs_bapiret2 ).

  ENDMETHOD.

  METHOD raise_exception_for_fm.

    "This method was created for raising exceptions within function modules
    RAISE EXCEPTION me.

  ENDMETHOD.

  METHOD split_long_value_to_bapiret2.

    TYPES:
      BEGIN OF ltv_variable,
        text TYPE c LENGTH 50,
      END OF ltv_variable.

    "Set key
    rs_bapiret2-type   = iv_type.
    rs_bapiret2-id     = iv_id.
    rs_bapiret2-number = iv_number.

    "Set text
    DATA:
      lv_text_string TYPE string,
      lt_text        TYPE STANDARD TABLE OF ltv_variable.

    lv_text_string = iv_long_value.

    CALL FUNCTION 'convert_CODE_to_table'
      EXPORTING
        i_string         = lv_text_string
        i_tabline_length = 50
      TABLES
        et_table         = lt_text.

    LOOP AT lt_text ASSIGNING FIELD-SYMBOL(<ls_variable>).

      CASE sy-tabix.
        WHEN 1.
          rs_bapiret2-message_v1 = <ls_variable>-text.
        WHEN 2.
          rs_bapiret2-message_v2 = <ls_variable>-text.
        WHEN 3.
          rs_bapiret2-message_v3 = <ls_variable>-text.
        WHEN 4.
          rs_bapiret2-message_v4 = <ls_variable>-text.
      ENDCASE.

    ENDLOOP.

    "Set message
    set_bapiret2_message_field(
      CHANGING cs_bapiret2 = rs_bapiret2 ).

  ENDMETHOD.

ENDCLASS.

CLASS zab_return_exc_vw DEFINITION
  CREATE PRIVATE .

  PUBLIC SECTION.

    CLASS-METHODS display_system_message
      IMPORTING
        !ix_return TYPE REF TO zab_return_exc .
    CLASS-METHODS display_system_mess_as_info
      IMPORTING
        !ix_return TYPE REF TO zab_return_exc .
    CLASS-METHODS display_system_mess_as_warning
      IMPORTING
        !ix_return TYPE REF TO zab_return_exc .
    CLASS-METHODS write_messages_to_screen
      IMPORTING
        !ix_return TYPE REF TO zab_return_exc .

ENDCLASS.

CLASS zab_return_exc_vw IMPLEMENTATION.

  METHOD display_system_message.

    DATA(ls_return) = ix_return->get_bapiret2_struc( ).

    IF ls_return-id IS INITIAL.

      MESSAGE
        ls_return-message
        TYPE    ls_return-type.

    ELSE.

      MESSAGE
        ID      ls_return-id
        TYPE    ls_return-type
        NUMBER  ls_return-number
        WITH    ls_return-message_v1
                ls_return-message_v2
                ls_return-message_v3
                ls_return-message_v4.

    ENDIF.

  ENDMETHOD.


  METHOD display_system_mess_as_info.

    DATA(ls_return) = ix_return->get_bapiret2_struc( ).

    IF ls_return-id IS INITIAL.

      MESSAGE
        ls_return-message
        TYPE    'I'
        DISPLAY LIKE ls_return-type.

    ELSE.

      MESSAGE
        ID      ls_return-id
        TYPE    'I'
        NUMBER  ls_return-number
        WITH    ls_return-message_v1
                ls_return-message_v2
                ls_return-message_v3
                ls_return-message_v4
        DISPLAY LIKE ls_return-type.

    ENDIF.

  ENDMETHOD.


  METHOD display_system_mess_as_warning.

    DATA(ls_return) = ix_return->get_bapiret2_struc( ).

    IF ls_return-id IS INITIAL.

      MESSAGE
        ls_return-message
        TYPE    'W'
        DISPLAY LIKE ls_return-type.

    ELSE.

      MESSAGE
        ID      ls_return-id
        TYPE    'W'
        NUMBER  ls_return-number
        WITH    ls_return-message_v1
                ls_return-message_v2
                ls_return-message_v3
                ls_return-message_v4
        DISPLAY LIKE ls_return-type.

    ENDIF.

  ENDMETHOD.


  METHOD write_messages_to_screen.

    WRITE:
      'T'(010),
      'ID                  '(011),
      'No.'(012),
      'Message'(013).

    DATA(lt_return) = ix_return->get_bapiret2_table( ).

    LOOP AT lt_return
      ASSIGNING FIELD-SYMBOL(<ls_return>).

      WRITE: /
        <ls_return>-type,
        <ls_return>-id,
        <ls_return>-number,
        <ls_return>-message.

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.

CLASS zui01_progress_bar_vw DEFINITION
*  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
      BEGIN OF gts_data,
        text                TYPE c LENGTH 100,
        max_value           TYPE i,
        show_value_ind      TYPE abap_bool,
        show_max_value_ind  TYPE abap_bool,
        show_percentage_ind TYPE abap_bool,
      END OF gts_data .
    TYPES:
      gtv_text TYPE c LENGTH 200 .
    TYPES:
      gtv_value TYPE i.

    CLASS-METHODS create
      IMPORTING
        !is_data           TYPE gts_data
      RETURNING
        VALUE(rr_instance) TYPE REF TO zui01_progress_bar_vw .
    METHODS set_value
      IMPORTING
        !iv_value TYPE gtv_value .
    METHODS clear .
    CLASS-METHODS static_clear .
    CLASS-METHODS static_set_text
      IMPORTING
        !iv_text TYPE gtv_text .
    METHODS add_text
      IMPORTING
        !iv_text TYPE string .
  PROTECTED SECTION.

    TYPES:
      gtv_percentage TYPE p LENGTH 6 DECIMALS 0 .

    DATA gs_data TYPE gts_data .
    DATA gv_prev_percentage TYPE gtv_percentage VALUE -1 ##NO_TEXT.
    DATA gv_message_shown_ind TYPE abap_bool .
    DATA gv_previous_time TYPE i .
    DATA gv_value TYPE gtv_value .

    METHODS get_percentage
      RETURNING
        VALUE(rv_percentage) TYPE gtv_percentage .
    METHODS get_refresh_needed_ind
      RETURNING
        VALUE(rv_refresh_needed_ind) TYPE xfeld .
    METHODS get_text
      RETURNING
        VALUE(rv_text) TYPE gtv_text .
  PRIVATE SECTION.
ENDCLASS.

CLASS zui01_progress_bar_vw IMPLEMENTATION.


  METHOD add_text.

    DATA(lv_percentage) = get_percentage( ).

    DATA(lv_text) = get_text( ).

    lv_text = |{ lv_text } { iv_text }|.

    CALL FUNCTION 'SAPGUI_PROGRESS_INDICATOR'
      EXPORTING
        percentage = lv_percentage
        text       = lv_text.

  ENDMETHOD.


  METHOD clear.

    "If no message shown, than clear is not needed.
    IF gv_message_shown_ind = abap_false.
      RETURN.
    ENDIF.

    CALL FUNCTION 'SAPGUI_PROGRESS_INDICATOR'
      EXPORTING
        percentage = 0
        text       = space.

  ENDMETHOD.


  METHOD create.

    rr_instance = NEW #( ).
    rr_instance->gs_data = is_data.

  ENDMETHOD.


  METHOD get_percentage.

    rv_percentage = ( gv_value / gs_data-max_value ) * 100.

  ENDMETHOD.


  METHOD get_refresh_needed_ind.

    DATA(lv_percentage) = get_percentage( ).

    "Get time diff
    DATA lv_time_diff TYPE i.
    GET RUN TIME FIELD DATA(lv_time).

    IF gv_previous_time = 0.
      lv_time_diff = -1.
    ELSE.
      lv_time_diff = lv_time - gv_previous_time.
    ENDIF.

    "Only update status bar if...
    "- First time
    "- More than one second between
    "- Percentage changed
    IF lv_time_diff = -1 OR
       lv_time_diff >= 1000000 OR
       lv_percentage <> gv_prev_percentage.

      gv_previous_time = lv_time.

      gv_prev_percentage = lv_percentage.
      gv_message_shown_ind = abap_true.

      rv_refresh_needed_ind  = abap_true.

    ENDIF.

  ENDMETHOD.


  METHOD get_text.

    DATA:
      lv_percent_char(3).

    DATA(lv_percentage) = get_percentage( ).

    "Set text
    lv_percent_char  = lv_percentage.
    SHIFT lv_percent_char LEFT DELETING LEADING space.

    rv_text = gs_data-text.

    IF gs_data-show_value_ind = abap_true.

      rv_text = rv_text && | | && gv_value.

      IF gs_data-show_max_value_ind = abap_true.
        rv_text = rv_text && |/| && gs_data-max_value.
      ENDIF.

    ENDIF.

    IF gs_data-show_percentage_ind = abap_true.
      rv_text = rv_text && | | && ' (' && lv_percent_char && |%)|.
    ENDIF.

  ENDMETHOD.


  METHOD set_value.

    gv_value = iv_value.

    IF sy-batch = 'X'.

      RETURN.

    ENDIF.

    DATA(lv_text) = get_text( ).

    DATA(lv_percentage) = get_percentage( ).

    DATA(lv_refresh_ind) = get_refresh_needed_ind( ).

    IF lv_refresh_ind = abap_true.

      CALL FUNCTION 'SAPGUI_PROGRESS_INDICATOR'
        EXPORTING
          percentage = lv_percentage
          text       = lv_text.

    ENDIF.

  ENDMETHOD.


  METHOD static_clear.

    "Use this method only for clearing progress bar not created by this class
    CALL FUNCTION 'SAPGUI_PROGRESS_INDICATOR'
      EXPORTING
        percentage = 0
        text       = space.

  ENDMETHOD.


  METHOD static_set_text.

    CALL FUNCTION 'SAPGUI_PROGRESS_INDICATOR'
      EXPORTING
        percentage = 0
        text       = iv_text.

  ENDMETHOD.
ENDCLASS.

CLASS zdb_transaction_dlo DEFINITION
*  public
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS commit
      IMPORTING
        !iv_wait        TYPE bapita-wait DEFAULT abap_true
        !iv_destination TYPE dest DEFAULT ''
      RAISING
        zab_return_exc.

    CLASS-METHODS rollback
      IMPORTING
        !iv_destination TYPE rfcdest DEFAULT ''.

ENDCLASS.

CLASS zdb_transaction_dlo IMPLEMENTATION.

  METHOD commit.

    DATA ls_return TYPE bapiret2.

    IF iv_destination IS INITIAL.

      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
        EXPORTING
          wait   = iv_wait
        IMPORTING
          return = ls_return.

    ELSE.

      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
        DESTINATION iv_destination
        EXPORTING
          wait   = iv_wait
        IMPORTING
          return = ls_return.

    ENDIF.

    "Handle exceptions
    DATA(lx_return) =
      zab_return_exc=>create_by_bapiret2_struc(
        is_return = ls_return ).

    IF lx_return IS NOT INITIAL.

      RAISE EXCEPTION lx_return.

    ENDIF.

  ENDMETHOD.

  METHOD rollback.

    DATA ls_return  TYPE bapiret2.

    IF iv_destination IS INITIAL.

      CALL FUNCTION 'BAPI_TRANSACTION_ROLLBACK'.

    ELSE.

      CALL FUNCTION 'BAPI_TRANSACTION_ROLLBACK'
        DESTINATION iv_destination.

    ENDIF.

  ENDMETHOD.

ENDCLASS.

CLASS zdp_abstract_data_provider DEFINITION.

  PUBLIC SECTION.

    TYPES:
      BEGIN OF gts_field_setting,
        field_path_name TYPE string,
        disabled_ind    TYPE abap_bool,
        required_ind    TYPE abap_bool,
      END OF gts_field_setting,
      gtt_field_settings TYPE STANDARD TABLE OF gts_field_setting WITH DEFAULT KEY.

  PROTECTED SECTION.

    METHODS:
      set_field_attr
        IMPORTING iv_field_path_name TYPE string
                  iv_disabled_ind    TYPE abap_bool OPTIONAL
                  iv_required_ind    TYPE abap_bool OPTIONAL
        CHANGING  ct_field_settings  TYPE gtt_field_settings.

ENDCLASS.

CLASS zdp_abstract_data_provider IMPLEMENTATION.

  METHOD set_field_attr.

    APPEND INITIAL LINE TO ct_field_settings
      ASSIGNING FIELD-SYMBOL(<ls_field_setting>).

    <ls_field_setting>-field_path_name    = iv_field_path_name.
    <ls_field_setting>-disabled_ind       = iv_disabled_ind.
    <ls_field_setting>-required_ind       = iv_required_ind.

  ENDMETHOD.

ENDCLASS.

* necessary to flush the automation queue
CLASS cl_gui_cfw DEFINITION LOAD.


CLASS zui01_mvc_object_abs DEFINITION.

  PUBLIC SECTION.

    TYPES:
      gtv_mvc_object_name TYPE char50,
      gtv_action_name     TYPE syst-ucomm.

ENDCLASS.

CLASS zui01_mvc_object_abs IMPLEMENTATION.

ENDCLASS.

CLASS zui01_mvc_action DEFINITION
  INHERITING FROM zui01_mvc_object_abs.

  PUBLIC SECTION.

    TYPES:
      BEGIN OF gts_data,
        object_name TYPE gtv_mvc_object_name,
        action_name TYPE gtv_action_name,
      END OF gts_data.

    CONSTANTS:
      gcc_validate_action         TYPE gtv_action_name VALUE 'VALIDATE'.

    METHODS:
      constructor
        IMPORTING is_data TYPE gts_data,
      get_data
        RETURNING VALUE(rs_data) TYPE gts_data.

  PROTECTED SECTION.

    DATA:
      gs_data TYPE gts_data.

ENDCLASS.

CLASS zui01_mvc_action IMPLEMENTATION.

  METHOD constructor.

    super->constructor( ).

    gs_data = is_data.

  ENDMETHOD.

  METHOD get_data.

    rs_data = gs_data.

  ENDMETHOD.

ENDCLASS.

CLASS zui01_mvc_comp_object_abs DEFINITION
  INHERITING FROM zui01_mvc_object_abs.

  PUBLIC SECTION.

    METHODS:
      constructor
        IMPORTING
          iv_object_name TYPE gtv_mvc_object_name,

      get_name
        RETURNING VALUE(rv_mvc_object_name) TYPE gtv_mvc_object_name.

    EVENTS:
      action
        EXPORTING VALUE(er_action) TYPE REF TO zui01_mvc_action.

  PROTECTED SECTION.

    DATA:
      gv_mvc_object_name TYPE gtv_mvc_object_name.

ENDCLASS.

CLASS zui01_mvc_comp_object_abs IMPLEMENTATION.

  METHOD constructor.

    super->constructor( ).

    gv_mvc_object_name = iv_object_name.

  ENDMETHOD.

  METHOD get_name.

    rv_mvc_object_name = gv_mvc_object_name.

  ENDMETHOD.

ENDCLASS.

CLASS zui01_mvc_view_vw DEFINITION
  ABSTRACT
  INHERITING FROM zui01_mvc_comp_object_abs.

  PUBLIC SECTION.

    METHODS set_data
      IMPORTING is_data               TYPE any
                iv_view_changed       TYPE abap_bool
                iv_controller_changed TYPE abap_bool.

    METHODS show
      IMPORTING iv_focus_ind TYPE abap_bool DEFAULT abap_false
      RAISING   zab_return_exc.

    METHODS refresh.

    METHODS close_screen.

    METHODS destruct.

    METHODS:
      execute_action
        IMPORTING iv_action_name TYPE gtv_action_name,
      raise_action
        IMPORTING iv_action_name TYPE gtv_action_name.

    METHODS get_view_changed_ind
      RETURNING VALUE(rv_view_changed_ind) TYPE abap_bool.

    METHODS get_controller_changed_ind
      RETURNING VALUE(rv_controller_changed_ind) TYPE abap_bool.

  PROTECTED SECTION.

    DATA:
      gv_at_initialization_ind TYPE abap_bool,

      gv_view_changed          TYPE abap_bool,
      gv_controller_changed    TYPE abap_bool.

    METHODS:
      validate.

ENDCLASS.

CLASS zui01_mvc_view_vw IMPLEMENTATION.

  METHOD set_data.

*    FIELD-SYMBOLS <ls_data> TYPE any.
*
*    ASSIGN gr_data->*
*      TO <ls_data>.
*
*    <ls_data> = is_data.

*    gs_data = is_data.

  ENDMETHOD.

  METHOD show.

  ENDMETHOD.

  METHOD refresh.

  ENDMETHOD.

  METHOD destruct.

  ENDMETHOD.

  METHOD close_screen.

    SET SCREEN 0.

  ENDMETHOD.

  METHOD validate.

    "Advice: do not use this. Use Validation in de business logic layer for reuse purposes.

  ENDMETHOD.

  METHOD execute_action.

    raise_action(
      iv_action_name     = iv_action_name ).

  ENDMETHOD.

  METHOD raise_action.

    DATA(lr_action) =
      NEW zui01_mvc_action( VALUE #(
        object_name = me->gv_mvc_object_name
        action_name = iv_action_name ) ).

    RAISE EVENT action
      EXPORTING er_action = lr_action.

  ENDMETHOD.

  METHOD get_view_changed_ind.

    rv_view_changed_ind = gv_view_changed.

    CLEAR gv_controller_changed.

  ENDMETHOD.

  METHOD get_controller_changed_ind.

    rv_controller_changed_ind = gv_controller_changed.

    CLEAR gv_controller_changed.

  ENDMETHOD.

ENDCLASS.

CLASS zui01_mvc_gui_status_vw DEFINITION
  INHERITING FROM zui01_mvc_view_vw.

  PUBLIC SECTION.

    TYPES:
      gtv_function_code  TYPE syst-ucomm,
      gtt_function_codes TYPE TABLE OF gtv_function_code.

    METHODS:
      constructor
        IMPORTING
          iv_object_name             TYPE gtv_mvc_object_name
          iv_program_name            TYPE progname OPTIONAL
          iv_gui_status_name         TYPE gui_status
          it_excluded_function_codes TYPE gtt_function_codes OPTIONAL,

      display.

  PROTECTED SECTION.

    DATA:
      gv_program_name            TYPE progname,
      gv_gui_status_name         TYPE gui_status,
      gt_excluded_function_codes TYPE gtt_function_codes.

ENDCLASS.

CLASS zui01_mvc_gui_status_vw IMPLEMENTATION.

  METHOD constructor.

    super->constructor( iv_object_name ).

    gv_program_name    = iv_program_name.
    gv_gui_status_name = iv_gui_status_name.

    gt_excluded_function_codes = it_excluded_function_codes.

  ENDMETHOD.

  METHOD display.

    IF gv_program_name IS NOT INITIAL.

      SET PF-STATUS gv_gui_status_name
        OF PROGRAM gv_program_name
        EXCLUDING gt_excluded_function_codes.

    ELSE.

      SET PF-STATUS gv_gui_status_name
        EXCLUDING gt_excluded_function_codes.

    ENDIF.

  ENDMETHOD.

ENDCLASS.

CLASS zui01_sel_scrn_gui_status_vw DEFINITION
  INHERITING FROM zui01_mvc_gui_status_vw.

  PUBLIC SECTION.

    METHODS:

      display REDEFINITION.

ENDCLASS.

CLASS zui01_sel_scrn_gui_status_vw IMPLEMENTATION.

  METHOD display.

    CALL FUNCTION 'RS_SET_SELSCREEN_STATUS'
      EXPORTING
        p_status  = gv_gui_status_name
        p_program = gv_program_name
      TABLES
        p_exclude = gt_excluded_function_codes.

  ENDMETHOD.

ENDCLASS.

CLASS zui01_mvc_controller_ctl DEFINITION
  ABSTRACT
  INHERITING FROM zui01_mvc_comp_object_abs.

  PUBLIC SECTION.

    METHODS get_current_view
      RETURNING VALUE(rr_current_view) TYPE REF TO zui01_mvc_view_vw.

    METHODS get_current_gui_status_vw
      RETURNING VALUE(rr_current_gui_status_vw) TYPE REF TO zui01_mvc_gui_status_vw.

  PROTECTED SECTION.

    DATA:
      gr_current_view          TYPE REF TO zui01_mvc_view_vw,
      gr_current_gui_status_vw TYPE REF TO zui01_mvc_gui_status_vw.

    METHODS on_action FOR EVENT action OF zui01_mvc_view_vw
      IMPORTING er_action.

ENDCLASS.

CLASS zui01_mvc_controller_ctl IMPLEMENTATION.

  METHOD get_current_view.

    rr_current_view = gr_current_view.

  ENDMETHOD.

  METHOD get_current_gui_status_vw.

    rr_current_gui_status_vw = gr_current_gui_status_vw.

  ENDMETHOD.

  METHOD on_action.

  ENDMETHOD.

ENDCLASS.

CLASS zui01_sel_scrn_action DEFINITION
  INHERITING FROM zui01_mvc_action .

  PUBLIC SECTION.
    CONSTANTS:
      gcc_load_of_program         TYPE gtv_action_name VALUE 'LOAD-OF-PROGRAM',
      gcc_initialization          TYPE gtv_action_name VALUE 'INITIALIZATION',
      gcc_exit_command            TYPE gtv_action_name VALUE 'ON EXIT COMMAND',
      gcc_selection_screen        TYPE gtv_action_name VALUE 'AT SELECTION-SCREEN',
      gcc_selection_screen_output TYPE gtv_action_name VALUE 'AT SELECTION-SCREEN OUTPUT',
      gcc_start_of_selection      TYPE gtv_action_name VALUE 'START-OF-SELECTION'.

ENDCLASS.

CLASS zui01_sel_scrn_action IMPLEMENTATION.

ENDCLASS.

CLASS zui01_selection_screen_vw DEFINITION
  INHERITING FROM zui01_mvc_view_vw.

  PUBLIC SECTION.

    TYPES:
      gtv_key                 TYPE i,
      gtv_sel_scrn_field_name TYPE c LENGTH 8,
      gtv_data_component_name TYPE c LENGTH 30,

      BEGIN OF gts_sel_screen_config,
        object_name                 TYPE gtv_mvc_object_name,
        select_options_restrictions TYPE sscr_restrict,
      END OF gts_sel_screen_config,

      BEGIN OF gts_mapping_field,
        key                 TYPE gtv_key,
        parent_key          TYPE gtv_key,
        kind                TYPE abap_typecategory,
        data_component_name TYPE gtv_data_component_name,
        screen_field_name   TYPE gtv_sel_scrn_field_name,
      END OF gts_mapping_field,
      gtt_mapping_field_list TYPE STANDARD TABLE OF gts_mapping_field WITH DEFAULT KEY.

    METHODS:
      constructor
        IMPORTING
          is_sel_screen_config TYPE gts_sel_screen_config,

      execute_action REDEFINITION,

      execute_report_event
        IMPORTING iv_action_name TYPE gtv_action_name,

      set_data_object_ref
        IMPORTING ir_data_object_ref TYPE REF TO data,

      mapping_set_component_list
        IMPORTING it_mapping_field_list TYPE gtt_mapping_field_list
        RAISING   zab_return_exc,

      map_screen_to_data
        RAISING zab_return_exc,

      map_data_to_screen
        RAISING zab_return_exc,

      set_field_settings
        IMPORTING it_field_settings TYPE zdp_abstract_data_provider=>gtt_field_settings,

      set_cursor
        IMPORTING iv_field_path_name TYPE string,

      set_cursor_2,

      pbo.

  PROTECTED SECTION.

    TYPES:
      gtv_mode TYPE c LENGTH 20,

      BEGIN OF gts_sel_screen_data,
        select_option_restrictions TYPE sscr_restrict,
      END OF  gts_sel_screen_data.

    CONSTANTS:
      gcc_consistency_check_mode TYPE gtv_mode VALUE 'CONSISTENCY_CHECK',
      gcc_data_to_screen_mode    TYPE gtv_mode VALUE 'DATA_TO_SCREEN',
      gcc_screen_to_data_mode    TYPE gtv_mode VALUE 'SCREEN_TO_DATA'.


    DATA:
      gs_sel_screen_data    TYPE gts_sel_screen_data,
      gv_variant_name       TYPE rsvar-variant,
      gt_mapping_field_list TYPE gtt_mapping_field_list,
      gr_data_object_ref    TYPE REF TO data,
      gt_field_settings     TYPE zdp_abstract_data_provider=>gtt_field_settings,
      gv_cursor_field_name  TYPE c LENGTH 8.

    METHODS:

      set_screen_attr,

      set_select_option_restrict,

      get_screen_field_by_path_name
        IMPORTING iv_field_path_name          TYPE string
        RETURNING VALUE(rv_screen_field_name) TYPE gtv_sel_scrn_field_name,

      set_map_list_2
        IMPORTING
                  iv_mode              TYPE gtv_mode
                  is_mapping_field     TYPE gts_mapping_field
                  ir_parent_type_descr TYPE REF TO cl_abap_typedescr
                  iv_parent_kind       TYPE abap_typecategory
        CHANGING
                  ca_data              TYPE any OPTIONAL
        RAISING   zab_return_exc,

      "PBO
      at_initialization,

      set_initial_variant,

      "PBO
      at_selection_screen_output,

      fill_listboxes,

      set_screen_field_attributes,

      "PAI
      at_selection_screen,

      check_do_validate
        IMPORTING iv_command_code        TYPE syst-ucomm
        RETURNING VALUE(rv_validate_ind) TYPE abap_bool,

      "PAI
      at_start_of_selection.

  PRIVATE SECTION.

    METHODS:
      "Helper
      get_default_variant_name
        RETURNING VALUE(rv_variant_name) TYPE rsvar-variant.

ENDCLASS.

CLASS zui01_selection_screen_vw IMPLEMENTATION.

  METHOD constructor.

    super->constructor(
      iv_object_name = is_sel_screen_config-object_name ).

    gs_sel_screen_data-select_option_restrictions = is_sel_screen_config-select_options_restrictions.

  ENDMETHOD.

  METHOD execute_report_event.

    execute_action( iv_action_name ).

  ENDMETHOD.

  METHOD set_data_object_ref.

    gr_data_object_ref = ir_data_object_ref.

  ENDMETHOD.

  METHOD mapping_set_component_list.

    gt_mapping_field_list = it_mapping_field_list.

    DATA(lr_struct_descr) = CAST cl_abap_structdescr( cl_abap_typedescr=>describe_by_data_ref( gr_data_object_ref ) ).
*    DATA(lr_struct_descr) = CAST cl_abap_structdescr( ir_type_descr ).

    LOOP AT gt_mapping_field_list
      ASSIGNING FIELD-SYMBOL(<ls_mapping_field>)
      WHERE parent_key = 0.

      set_map_list_2(
        iv_mode               = gcc_consistency_check_mode
        is_mapping_field      = <ls_mapping_field>
        ir_parent_type_descr  = lr_struct_descr
        iv_parent_kind        = cl_abap_typedescr=>kind_struct ).

    ENDLOOP.

  ENDMETHOD.

  METHOD set_map_list_2.

    CASE iv_parent_kind.

      WHEN cl_abap_typedescr=>kind_struct.

        DATA(lr_parent_struct_descr) = CAST cl_abap_structdescr( ir_parent_type_descr ).

        DATA(lt_parent_components) = lr_parent_struct_descr->get_components( ).

        READ TABLE lt_parent_components
          WITH KEY name = is_mapping_field-data_component_name
          ASSIGNING FIELD-SYMBOL(<ls_component>).

        IF sy-subrc <> 0.

          DATA(lr_return_exc) =
            zab_return_exc=>create_by_text(
              |Data component { is_mapping_field-data_component_name } does not exist in screen data structure. | &&
              |Key: { is_mapping_field-key }, Screen field name: { is_mapping_field-screen_field_name }.| ).

          RAISE EXCEPTION lr_return_exc.

        ENDIF.

        IF is_mapping_field-kind <> <ls_component>-type->kind.

          lr_return_exc =
            zab_return_exc=>create_by_text(
              |Data component { is_mapping_field-data_component_name } does not exist in screen data structure. | &&
              |Key: { is_mapping_field-key }, Screen field name: { is_mapping_field-screen_field_name }.| ).

          RAISE EXCEPTION lr_return_exc.

        ENDIF.

        CASE is_mapping_field-kind.


          WHEN cl_abap_typedescr=>kind_struct.

            DATA(lr_struct_descr) = CAST cl_abap_structdescr( <ls_component>-type ).

            LOOP AT gt_mapping_field_list
              ASSIGNING FIELD-SYMBOL(<ls_mapping_field>)
              WHERE parent_key = is_mapping_field-key.

              CASE iv_mode.

                WHEN gcc_screen_to_data_mode OR
                     gcc_data_to_screen_mode.

                  ASSIGN COMPONENT <ls_mapping_field>-data_component_name
                    OF STRUCTURE ca_data
                    TO FIELD-SYMBOL(<la_sub_component>).

                  IF sy-subrc <> 0.

                    lr_return_exc =
                      zab_return_exc=>create_by_text(
                        |Data component { is_mapping_field-data_component_name } has component { <ls_mapping_field>-data_component_name } but it does not exits. | &&
                                |Key: { is_mapping_field-key }, Screen field name: { is_mapping_field-screen_field_name }.| ).

                    RAISE EXCEPTION lr_return_exc.

                  ENDIF.

                  "Set mapping sub component
                  set_map_list_2(
                    EXPORTING
                      iv_mode               = iv_mode
                      is_mapping_field      = <ls_mapping_field>
                      ir_parent_type_descr  = lr_struct_descr
                      iv_parent_kind        = cl_abap_typedescr=>kind_struct
                    CHANGING
                      ca_data               = <la_sub_component> ).

                WHEN gcc_consistency_check_mode.

                  "Set mapping sub component
                  set_map_list_2(
                    EXPORTING
                      iv_mode               = iv_mode
                      is_mapping_field      = <ls_mapping_field>
                      ir_parent_type_descr  = lr_struct_descr
                      iv_parent_kind        = cl_abap_typedescr=>kind_struct ).

              ENDCASE.

            ENDLOOP.

          WHEN cl_abap_typedescr=>kind_elem.

            "Check screen field name is filled
            IF is_mapping_field-screen_field_name IS INITIAL.

              lr_return_exc =
                zab_return_exc=>create_by_text(
                  |Data component { is_mapping_field-data_component_name } is a data element but has no screen field name. | &&
                  |Key: { is_mapping_field-key }.| ).

              RAISE EXCEPTION lr_return_exc.

            ENDIF.

            ASSIGN (is_mapping_field-screen_field_name)
              TO FIELD-SYMBOL(<lv_screen_field_data>).

            IF sy-subrc <> 0.

              lr_return_exc =
                zab_return_exc=>create_by_text(
                  |Screen field name { is_mapping_field-screen_field_name } does not exist for data field { is_mapping_field-data_component_name } . | &&
                    |Key: { is_mapping_field-key }.| ).

              RAISE EXCEPTION lr_return_exc.

            ENDIF.

            CASE iv_mode.

              WHEN gcc_consistency_check_mode.

              WHEN gcc_screen_to_data_mode.

                ca_data = <lv_screen_field_data>.

              WHEN gcc_data_to_screen_mode.

                <lv_screen_field_data> = ca_data.

            ENDCASE.

          WHEN cl_abap_typedescr=>kind_table.

            "Check screen field name is filled
            IF is_mapping_field-screen_field_name IS INITIAL.

              lr_return_exc =
                zab_return_exc=>create_by_text(
                  |Data component { is_mapping_field-data_component_name } is a data element but has no screen field name. | &&
                  |Key: { is_mapping_field-key }.| ).

              RAISE EXCEPTION lr_return_exc.

            ENDIF.

            FIELD-SYMBOLS <lv_screen_field_table> TYPE STANDARD TABLE.

            DATA(lv_field_table_name) = is_mapping_field-screen_field_name && |[]|.
            ASSIGN (lv_field_table_name)
              TO <lv_screen_field_table>.

            IF sy-subrc <> 0.

              lr_return_exc =
                zab_return_exc=>create_by_text(
                  |Screen field name { is_mapping_field-screen_field_name } does not exist for data field { is_mapping_field-data_component_name } . | &&
                  |Key: { is_mapping_field-key }.| ).

              RAISE EXCEPTION lr_return_exc.

            ENDIF.

            CASE iv_mode.

              WHEN gcc_consistency_check_mode.

              WHEN gcc_screen_to_data_mode.

                FIELD-SYMBOLS <lt_target_table_1> TYPE STANDARD TABLE.

                ASSIGN ca_data TO <lt_target_table_1>.

                REFRESH <lt_target_table_1>.

                LOOP AT <lv_screen_field_table>
                  ASSIGNING FIELD-SYMBOL(<ls_source_record_1>).

                  APPEND INITIAL LINE TO <lt_target_table_1>
                    ASSIGNING FIELD-SYMBOL(<ls_target_record_1>).

                  MOVE-CORRESPONDING <ls_source_record_1>
                    TO <ls_target_record_1>.

                ENDLOOP.

              WHEN gcc_data_to_screen_mode.

                FIELD-SYMBOLS <lt_source_table_2> TYPE STANDARD TABLE.

                ASSIGN ca_data TO <lt_source_table_2>.

                REFRESH <lv_screen_field_table>.

                LOOP AT <lt_source_table_2>
                  ASSIGNING FIELD-SYMBOL(<ls_source_record_2>).

                  APPEND INITIAL LINE TO <lv_screen_field_table>
                    ASSIGNING FIELD-SYMBOL(<ls_target_record_2>).

                  MOVE-CORRESPONDING <ls_source_record_2>
                    TO <ls_target_record_2>.

                ENDLOOP.

            ENDCASE.

          WHEN OTHERS.

            DATA(lx_return) = zab_return_exc=>create_by_text(
              iv_message    = 'Mapping field kind &1 is not known.'
              iv_field_name = 'MAPPING_FIELD-KIND'
              iv_variable_1 = CONV #( is_mapping_field-kind ) ).

            RAISE EXCEPTION lx_return.

        ENDCASE.

      WHEN OTHERS.

        lx_return = zab_return_exc=>create_by_text(
          iv_message    = 'Parent kind &1 is not known.'
          iv_field_name = 'IV_PARENT_KIND'
          iv_variable_1 = CONV #( iv_parent_kind ) ).

        RAISE EXCEPTION lx_return.

    ENDCASE.

  ENDMETHOD.

  METHOD map_screen_to_data.

    DATA(lr_struct_descr) = CAST cl_abap_structdescr( cl_abap_typedescr=>describe_by_data_ref( gr_data_object_ref ) ).

    LOOP AT gt_mapping_field_list
      ASSIGNING FIELD-SYMBOL(<ls_mapping_field>)
      WHERE parent_key = 0.

      ASSIGN me->gr_data_object_ref->*
        TO FIELD-SYMBOL(<ls_data>).

      ASSIGN COMPONENT <ls_mapping_field>-data_component_name
        OF STRUCTURE <ls_data>
        TO FIELD-SYMBOL(<la_data_component>).

      set_map_list_2(
        EXPORTING
          iv_mode               = gcc_screen_to_data_mode
          is_mapping_field      = <ls_mapping_field>
          ir_parent_type_descr  = lr_struct_descr
          iv_parent_kind        = cl_abap_typedescr=>kind_struct
        CHANGING
          ca_data               = <la_data_component> ).

    ENDLOOP.

  ENDMETHOD.

  METHOD map_data_to_screen.

    DATA(lr_struct_descr) = CAST cl_abap_structdescr( cl_abap_typedescr=>describe_by_data_ref( gr_data_object_ref ) ).

    LOOP AT gt_mapping_field_list
      ASSIGNING FIELD-SYMBOL(<ls_mapping_field>)
      WHERE parent_key = 0.

      ASSIGN me->gr_data_object_ref->*
        TO FIELD-SYMBOL(<ls_data>).

      ASSIGN COMPONENT <ls_mapping_field>-data_component_name
        OF STRUCTURE <ls_data>
        TO FIELD-SYMBOL(<la_data_component>).

      set_map_list_2(
        EXPORTING
          iv_mode               = gcc_data_to_screen_mode
          is_mapping_field      = <ls_mapping_field>
          ir_parent_type_descr  = lr_struct_descr
          iv_parent_kind        = cl_abap_typedescr=>kind_struct
        CHANGING
          ca_data               = <la_data_component> ).

    ENDLOOP.

  ENDMETHOD.

  METHOD set_field_settings.

    gt_field_settings = it_field_settings.

  ENDMETHOD.

  METHOD set_cursor.

    DATA(lv_screen_field_name) = me->get_screen_field_by_path_name( iv_field_path_name ).

    IF lv_screen_field_name IS INITIAL.
      RETURN.
    ENDIF.

    gv_cursor_field_name = lv_screen_field_name.

  ENDMETHOD.

  METHOD set_cursor_2.

    IF gv_cursor_field_name IS NOT INITIAL.

      SET CURSOR FIELD gv_cursor_field_name.

      CLEAR gv_cursor_field_name.

    ENDIF.

  ENDMETHOD.

  METHOD pbo.

    set_screen_attr( ).

    set_select_option_restrict( ).


    set_cursor_2( ).

  ENDMETHOD.

  METHOD set_screen_attr.

    "Init
    LOOP AT SCREEN.

      IF screen-input = 0.

        screen-input = 1.

        MODIFY SCREEN.

      ENDIF.

      IF screen-required = 1.

        screen-required = 0.

        MODIFY SCREEN.

      ENDIF.

    ENDLOOP.

    "Set attributes
    LOOP AT gt_field_settings
      ASSIGNING FIELD-SYMBOL(<ls_field_setting>).

      DATA(lv_screen_field_name) =
        get_screen_field_by_path_name(
          iv_field_path_name = <ls_field_setting>-field_path_name ).

      IF lv_screen_field_name IS INITIAL.
        CONTINUE.
      ENDIF.

      LOOP AT SCREEN.

        IF screen-name = lv_screen_field_name.

          IF <ls_field_setting>-disabled_ind = abap_true.

            screen-input = 0.

            MODIFY SCREEN.

          ENDIF.

          IF <ls_field_setting>-required_ind = abap_true.

            screen-required = 2.

            MODIFY SCREEN.

          ENDIF.

        ENDIF.

      ENDLOOP.

    ENDLOOP.

  ENDMETHOD.

  METHOD set_select_option_restrict.

    CALL FUNCTION 'SELECT_OPTIONS_RESTRICT'
      EXPORTING
        restriction            = me->gs_sel_screen_data-select_option_restrictions
      EXCEPTIONS
        too_late               = 1
        repeated               = 2
        selopt_without_options = 3
        selopt_without_signs   = 4
        invalid_sign           = 5
        empty_option_list      = 6
        invalid_kind           = 7
        repeated_kind_a        = 8
        OTHERS                 = 9.

  ENDMETHOD.

  METHOD get_screen_field_by_path_name.

    SPLIT iv_field_path_name
      AT '-'
      INTO TABLE DATA(lt_field_parts)
      IN CHARACTER MODE.

    IF lt_field_parts[] IS INITIAL.

      MESSAGE
        |Field path name is empty.|
        TYPE 'W'.

      RETURN.

    ENDIF.

    DATA(lv_key) = 0.

    LOOP AT lt_field_parts
      ASSIGNING FIELD-SYMBOL(<lv_field_part>).

      READ TABLE me->gt_mapping_field_list
        WITH KEY
          data_component_name = <lv_field_part>
          parent_key          = lv_key
        ASSIGNING FIELD-SYMBOL(<ls_field_mapping>).

      IF sy-subrc <> 0.

        MESSAGE
          |Field { <lv_field_part> } not found in field path { iv_field_path_name }|
          TYPE 'W'.

        RETURN.

      ENDIF.

      lv_key = <ls_field_mapping>-key.

    ENDLOOP.

    IF <ls_field_mapping>-screen_field_name IS INITIAL.

      MESSAGE
        |Field path name { iv_field_path_name } has no screen field name.|
        TYPE 'W'.

      RETURN.

    ENDIF.

    rv_screen_field_name = <ls_field_mapping>-screen_field_name.

  ENDMETHOD.

  METHOD execute_action.

    CASE iv_action_name.

      WHEN zui01_sel_scrn_action=>gcc_initialization.

        IF gv_at_initialization_ind = abap_false.

          at_initialization( ).

          gv_at_initialization_ind = abap_true.

        ENDIF.

      WHEN zui01_sel_scrn_action=>gcc_selection_screen_output.

        at_selection_screen_output( ).

      WHEN zui01_sel_scrn_action=>gcc_selection_screen.

        at_selection_screen( ).

      WHEN zui01_sel_scrn_action=>gcc_start_of_selection.

        at_start_of_selection( ).

      WHEN OTHERS.

    ENDCASE.

  ENDMETHOD.

  METHOD at_initialization.

    "Set initial variant
    set_initial_variant( ).

  ENDMETHOD.

  METHOD set_initial_variant.

    gv_variant_name = get_default_variant_name( ).

    IF gv_variant_name IS NOT INITIAL.

      CALL FUNCTION 'RS_SUPPORT_SELECTIONS'
        EXPORTING
          report               = sy-repid
          variant              = gv_variant_name
        EXCEPTIONS
          variant_not_existent = 01
          variant_obsolete     = 02.

    ENDIF.

  ENDMETHOD.

  METHOD at_selection_screen_output. "PBO

    fill_listboxes( ).

    set_screen_field_attributes( ).

  ENDMETHOD.

  METHOD fill_listboxes.

    "Redefine in sub class

  ENDMETHOD.

  METHOD set_screen_field_attributes.

    "Redefine in sub class

  ENDMETHOD.

  METHOD at_selection_screen. "PAI

    DATA(lv_validate_ind) = check_do_validate( sy-ucomm ).

    "Import: this is screen validation only.
    "Preferred is validation in the business layer in stead of
    "UI layer. So also the Service layer and business layer
    "can make use of the validation.
    IF lv_validate_ind = abap_true.

      validate( ).

    ENDIF.

  ENDMETHOD.

  METHOD check_do_validate.

    "Based on iv_command_code do or do not validate
    rv_validate_ind = abap_true.

  ENDMETHOD.

  METHOD at_start_of_selection.

  ENDMETHOD.

  METHOD get_default_variant_name.

    "ABAP Code copied from T: IW72, Program: RIAUFK20, Form-routine: VARIANT_START_F16

    DATA:
      lv_subrc        LIKE sy-subrc,
      lv_repid        TYPE rsvar-report,
      lv_variant_name TYPE rsvar-variant.

    lv_repid = sy-repid.

    "---------------------------------------------------------------
    "1. User specific variant
    "---------------------------------------------------------------
    CLEAR lv_variant_name.

    lv_variant_name = 'U_'.

    WRITE sy-uname TO lv_variant_name+2.

    CALL FUNCTION 'RS_VARIANT_EXISTS'
      EXPORTING
        report  = lv_repid
        variant = lv_variant_name
      IMPORTING
        r_c     = lv_subrc.

    IF lv_subrc = 0.
      rv_variant_name = lv_variant_name.
      RETURN.
    ENDIF.

    "---------------------------------------------------------------
    "2. Customizing variant
    "---------------------------------------------------------------
    CLEAR lv_variant_name.

    lv_variant_name = 'SAP_TCODE_'.

    WRITE sy-tcode TO lv_variant_name+10.

    CALL FUNCTION 'RS_VARIANT_EXISTS'
      EXPORTING
        report  = lv_repid
        variant = lv_variant_name
      IMPORTING
        r_c     = lv_subrc.

    IF lv_subrc = 0.
      rv_variant_name = lv_variant_name.
      RETURN.
    ENDIF.

    "---------------------------------------------------------------
    "3. System variant
    "---------------------------------------------------------------
    CLEAR lv_variant_name.

    lv_variant_name = 'SAP&TCODE_'.

    WRITE sy-tcode TO lv_variant_name+10.

    CALL FUNCTION 'RS_VARIANT_EXISTS'
      EXPORTING
        report  = lv_repid
        variant = lv_variant_name
      IMPORTING
        r_c     = lv_subrc.

    IF lv_subrc = 0.
      rv_variant_name = lv_variant_name.
      RETURN.
    ENDIF.

  ENDMETHOD.

ENDCLASS.

CLASS zab_abap_string_converter DEFINITION.

  PUBLIC SECTION.

    TYPES gtt_swastrtab TYPE STANDARD TABLE OF swastrtab WITH DEFAULT KEY.

    METHODS:
      convert_to_table
        IMPORTING iv_source_string      TYPE string
                  iv_target_line_length TYPE i
        CHANGING  ct_target_table       TYPE STANDARD TABLE
        RAISING   zab_return_exc.

    METHODS
      convert_to_table_min
        IMPORTING
                  VALUE(input_string)           TYPE  string
                  VALUE(max_component_length)   TYPE  i DEFAULT swb1_html_line_length
                  VALUE(terminating_separators) TYPE  string OPTIONAL
                  VALUE(opening_separators)     TYPE  string OPTIONAL
        RETURNING VALUE(string_components)      TYPE gtt_swastrtab
        RAISING   zab_return_exc.

    METHODS
      convert_to_table_max
        IMPORTING
                  VALUE(input_string)           TYPE  string
                  VALUE(max_component_length)   TYPE  i DEFAULT swb1_html_line_length
                  VALUE(terminating_separators) TYPE  string OPTIONAL
                  VALUE(opening_separators)     TYPE  string OPTIONAL
        RETURNING VALUE(string_components)      TYPE gtt_swastrtab.

ENDCLASS.

CLASS zab_abap_string_converter IMPLEMENTATION.

  METHOD convert_to_table.

    DATA lv_opening_separators TYPE string.
    DATA lv_terminating_separators TYPE string.

    lv_opening_separators = | |.
    lv_terminating_separators = |\n|.

    DATA(lt_string_components) =
      NEW zab_abap_string_converter( )->convert_to_table_min(
        input_string           = iv_source_string
        max_component_length   = 255
        terminating_separators = lv_terminating_separators
        opening_separators     = lv_opening_separators ).

    LOOP AT lt_string_components
    ASSIGNING FIELD-SYMBOL(<lv_comp>).

      APPEND INITIAL LINE TO ct_target_table
      ASSIGNING FIELD-SYMBOL(<lv_target_line>).

      DATA(lv_line) = <lv_comp>-str.

      DATA(lv_length) = strlen( lv_line ).

      IF lv_length > 0.

        DATA(lv_off_set) = lv_length - 1.

        DATA(lv_last_char) = substring( val = lv_line off = lv_off_set len = 1 ).

      ENDIF.

      IF lv_last_char = |\n|.

        lv_length = lv_length - 1.

        DATA lv_line_2 TYPE string.
        lv_line_2 = substring( val = lv_line off = 0 len = lv_length ).

        <lv_target_line> = lv_line_2.

      ELSE.

        <lv_target_line> = <lv_comp>-str.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD convert_to_table_min.

    CONSTANTS lv_skip_separator TYPE abap_bool VALUE abap_true.

    DATA: total_length     TYPE i,
          remaining_length TYPE i,
          current_offset   TYPE i,
          current_char     TYPE c,
*          search_position  TYPE i,
          lv_position      TYPE i.

    DATA: current_string TYPE swastrtab.


    CHECK NOT input_string IS INITIAL.

**** UK 00/06/14 Unicode syntax
    DESCRIBE FIELD current_string-str
      LENGTH total_length
      IN CHARACTER MODE.

    IF max_component_length > total_length.

      MESSAGE ID 'W8'
        TYPE 'S'
        NUMBER 602
        WITH total_length.

    ELSEIF max_component_length <= 0.

      max_component_length = 100.

    ENDIF.

    IF terminating_separators IS INITIAL. " default separators
      terminating_separators = ' >=)].,;:-?!'.
    ENDIF.

    total_length     = strlen( input_string ).
    remaining_length = total_length.
    current_offset   = 0.

    CLEAR string_components[].

    DATA(lv_skipped_ind) = abap_false.

    WHILE remaining_length > 0.

      "Initi
      DATA(lv_previous_skipped) = lv_skipped_ind.

      lv_skipped_ind = abap_false.

      "Set max length
      IF remaining_length < max_component_length.

        DATA(lv_line_length) = remaining_length.

      ELSE.

        lv_line_length  = max_component_length.

      ENDIF.

      lv_position = 1.

      "find a position where the string may be split:
      WHILE lv_position <= lv_line_length.

        "search (backwards) for separators.
        DATA(lv_offset) = current_offset + lv_position - 1.

        current_char = input_string+lv_offset(1).

        IF terminating_separators CA current_char.
          "this separator remains on the current line.
          EXIT.
        ENDIF.

        lv_position = lv_position + 1.

      ENDWHILE.

      IF lv_position = lv_line_length..

        "no separator found, cut a maximal piece ...
        lv_position = lv_line_length.

      ELSE.

        "Skip the separator
        IF lv_skip_separator = abap_true.

          lv_position = lv_position - 1.

          lv_skipped_ind = abap_true.

        ENDIF.

      ENDIF.

      current_string-len = lv_position.
      current_string-str = input_string+current_offset(lv_position).
      APPEND current_string TO string_components.

      "Skip the separator
      IF lv_skipped_ind = abap_true.

        lv_position = lv_position + 1.

      ENDIF.

      current_offset = current_offset + lv_position.

      SUBTRACT lv_position FROM remaining_length.

    ENDWHILE.  " remaining_length > lv_position

    IF remaining_length > 0.

      CLEAR current_string.
      current_string-len = remaining_length.
      current_string-str = input_string+current_offset(remaining_length).
      APPEND current_string TO string_components.

    ENDIF.

  ENDMETHOD.


  METHOD convert_to_table_max.

    CONSTANTS lv_skip_separator TYPE abap_bool VALUE abap_true.

    DATA: total_length     TYPE i,
          remaining_length TYPE i,
          current_offset   TYPE i,
          current_char     TYPE c,
*          search_position  TYPE i,
          lv_position      TYPE i.

    DATA: current_string TYPE swastrtab.

    CHECK NOT input_string IS INITIAL.

    DESCRIBE FIELD current_string-str LENGTH total_length
      IN CHARACTER MODE.

    IF max_component_length > total_length.

      MESSAGE ID 'W8'
        TYPE 'S'
        NUMBER 602
        WITH total_length.

    ELSEIF max_component_length <= 0.

      max_component_length = 100.

    ENDIF.

    IF terminating_separators IS INITIAL. " default separators
      terminating_separators = ' >=)].,;:-?!'.
    ENDIF.

    total_length     = strlen( input_string ).
    remaining_length = total_length.
    current_offset   = 0.

    CLEAR string_components[].

    DATA(lv_skipped_ind) = abap_false.

    WHILE remaining_length > 0.

      "Initi
      DATA(lv_previous_skipped) = lv_skipped_ind.

      lv_skipped_ind = abap_false.

      "Set max length
      IF remaining_length < max_component_length.

        DATA(lv_line_length) = remaining_length.

      ELSE.

        lv_line_length  = max_component_length.

      ENDIF.

      lv_position = lv_line_length.


      "find a position where the string may be split:
      WHILE lv_position <= lv_line_length.

        "search (backwards) for separators.
        DATA(lv_offset) = current_offset + lv_position - 1.

        current_char = input_string+lv_offset(1).

        IF terminating_separators CA current_char.
          "this separator remains on the current line.
          EXIT.
        ENDIF.

        lv_position = lv_position - 1.

      ENDWHILE.

      IF lv_position = 0.

        "no separator found, cut a maximal piece ...
        lv_position = lv_line_length.

      ELSE.

        "Skip the separator
        IF lv_skip_separator = abap_true.

          lv_position = lv_position - 1.

          lv_skipped_ind = abap_true.

        ENDIF.

      ENDIF.

      current_string-len = lv_position.
      current_string-str = input_string+current_offset(lv_position).
      APPEND current_string TO string_components.

      "Skip the separator
      IF lv_skipped_ind = abap_true.

        lv_position = lv_position + 1.

      ENDIF.

      current_offset = current_offset + lv_position.

      SUBTRACT lv_position FROM remaining_length.

    ENDWHILE.  " remaining_length > lv_position

    IF remaining_length > 0.

      CLEAR current_string.
      current_string-len = remaining_length.
      current_string-str = input_string+current_offset(remaining_length).
      APPEND current_string TO string_components.

    ENDIF.

  ENDMETHOD.

ENDCLASS.

CLASS zab_abap_text_bo DEFINITION.

  PUBLIC SECTION.

    CLASS-METHODS:
      get_spaces
        IMPORTING iv_tab_character_count TYPE i
                  iv_tab_count           TYPE i
        RETURNING VALUE(rv_text)         TYPE string,
      add_trailing_space
        IMPORTING iv_text        TYPE any
                  iv_length      TYPE i
        RETURNING VALUE(rv_text) TYPE string.

  PROTECTED SECTION.
    DATA:
      gv_tab_character_count TYPE i.

ENDCLASS.

CLASS zui01_selection_screen_ctl DEFINITION
  INHERITING FROM zui01_mvc_controller_ctl.

  PUBLIC SECTION.

    METHODS execute_report_event
      IMPORTING iv_report_event_name TYPE gtv_action_name.

    METHODS get_last_event_name
      RETURNING VALUE(rv_event_name) TYPE gtv_action_name.

  PROTECTED SECTION.

    DATA gv_unit_test_ind  TYPE abap_bool.
    DATA gv_last_event_name TYPE gtv_action_name.

    METHODS get_report_event_view_vw
      IMPORTING iv_action_name                TYPE gtv_action_name
      RETURNING VALUE(rr_selection_screen_vw) TYPE REF TO zui01_mvc_view_vw.

    METHODS at_load_of_program.

    METHODS on_action REDEFINITION.

    METHODS execute_action
      IMPORTING iv_mvc_object_name TYPE gtv_mvc_object_name
                iv_mvc_action_name TYPE gtv_action_name. "rename naar iv_mvc_action_name en gtv_mvc_action_name

ENDCLASS.

CLASS zui01_selection_screen_ctl IMPLEMENTATION.

  METHOD get_report_event_view_vw.

    "Implement in sub class

  ENDMETHOD.

  METHOD get_last_event_name.

    rv_event_name = gv_last_event_name.

  ENDMETHOD.

  METHOD execute_report_event.

    gv_last_event_name = iv_report_event_name.

    CASE iv_report_event_name.

      WHEN zui01_sel_scrn_action=>gcc_exit_command.

        IF sy-ucomm IS NOT INITIAL.

          DATA(lv_action_name) = |EXIT: { sy-ucomm }|.

        ELSE.

          lv_action_name = iv_report_event_name.

        ENDIF.

      WHEN zui01_sel_scrn_action=>gcc_selection_screen.

        IF sy-ucomm IS NOT INITIAL.

          lv_action_name = sy-ucomm.

        ELSE.

          lv_action_name = iv_report_event_name.

        ENDIF.

      WHEN OTHERS.

        lv_action_name = iv_report_event_name.

    ENDCASE.

    execute_action(
      iv_mvc_object_name  = me->gr_current_view->get_name( )
      iv_mvc_action_name  = CONV #( lv_action_name ) ).

  ENDMETHOD.

  METHOD at_load_of_program.

    "Redefine in sub class

  ENDMETHOD.

  METHOD on_action.

    DATA(ls_action_data) = er_action->get_data( ).

    execute_action(
      iv_mvc_object_name = ls_action_data-object_name
      iv_mvc_action_name = ls_action_data-action_name ).


  ENDMETHOD.

  METHOD execute_action.

    "Redefine in sub class

  ENDMETHOD.

ENDCLASS.

CLASS zab_abap_text_bo IMPLEMENTATION.

  METHOD get_spaces.

    DO iv_tab_count TIMES.

      DO iv_tab_character_count TIMES.

        rv_text = rv_text && | |.

      ENDDO.

    ENDDO.

  ENDMETHOD.

  METHOD add_trailing_space.

    DATA(lv_text_length) = strlen( iv_text ).

    IF lv_text_length > iv_length.
      rv_text = iv_text.
      RETURN.
    ENDIF.

    DATA(lv_spaces_length) = iv_length - lv_text_length.

    DATA(lv_spaces) =
      zab_abap_text_bo=>get_spaces(
        iv_tab_character_count = 1
        iv_tab_count = lv_spaces_length ).

    rv_text = iv_text && lv_spaces.

  ENDMETHOD.

ENDCLASS.

CLASS zbo_business_object_list_vw DEFINITION.

  PUBLIC SECTION.

    TYPES:
      gtv_module_abbrev TYPE c LENGTH 3.

    TYPES:
      BEGIN OF gts_business_object,

        create_bapi          TYPE swotlv-abapname,
        read_bapi            TYPE swotlv-abapname,
        update_bapi          TYPE swotlv-abapname,

        component            TYPE df14l-ps_posid,
        module_abbrev        TYPE gtv_module_abbrev,

        bo_name              TYPE swotlv-abapname,
        main_db_table_name   TYPE tabname16,
        bor_object_type_name TYPE tojtb-name,

      END OF gts_business_object.

    TYPES:
      BEGIN OF gts_business_object_2,
        source                       TYPE t001t-ltext,

        name                         TYPE tojtb-name,
        short_description            TYPE tojtt-stext,

        read_fm                      TYPE swotlv-abapname,
        read_status                  TYPE swotlv-modelonly,

        create_fm                    TYPE swotlv-abapname,
        create_status                TYPE swotlv-modelonly,

        update_fm                    TYPE swotlv-abapname,
        update_status                TYPE swotlv-modelonly,

        main_db_table                TYPE swotlv-refstruct,
        key_fields                   TYPE tojtt-ntext,

        component                    TYPE df14l-ps_posid,

        create_date                  TYPE tojtb-crea_date,
        version                      TYPE tojtb-version,
        logon_lang_tojtt_short_descr TYPE tojtt-stext,
        long_description             TYPE tojtt-ntext,
        id                           TYPE tojtb-winhlpind,

      END OF gts_business_object_2,

      gtt_business_object_2 TYPE STANDARD TABLE OF gts_business_object_2 WITH DEFAULT KEY.

    METHODS show_business_object_list
      RETURNING VALUE(rs_business_object) TYPE gts_business_object.

    METHODS read_bo_list
      RETURNING VALUE(rt_business_object_2) TYPE gtt_business_object_2.

  PROTECTED SECTION.

    METHODS add_extra_bo_s
      CHANGING ct_business_object TYPE gtt_business_object_2.

    METHODS show_bo_list
      IMPORTING it_business_object_2      TYPE gtt_business_object_2
      RETURNING VALUE(rs_business_object) TYPE gts_business_object.

    METHODS show_module_abbrev_list
      IMPORTING iv_component            TYPE df14l-ps_posid
      RETURNING VALUE(rv_module_abbrev) TYPE gtv_module_abbrev.

    METHODS create_catalog
      IMPORTING it_business_object_2 TYPE gtt_business_object_2
      RETURNING VALUE(rt_dfies_tab)  TYPE dfies_tab.

ENDCLASS.

CLASS zbo_business_object_list_vw IMPLEMENTATION.

  METHOD show_business_object_list.

    DATA(lt_business_object_2) =
      read_bo_list( ).

    rs_business_object = show_bo_list( lt_business_object_2 ).

    rs_business_object-module_abbrev =
      show_module_abbrev_list( rs_business_object-component ).

  ENDMETHOD.

  METHOD read_bo_list.

    SELECT
        'BAPI-explorer'               AS source,
        tojtb~name                    AS name,

        CASE
          WHEN tojtt~stext  IS NOT NULL THEN
            tojtt~stext
          ELSE
            tojtb~name
        END AS short_description,

        create_method~abapname        AS create_fm,
        create_method~modelonly       AS create_status,

        read_method~abapname          AS read_fm,
        read_method~modelonly         AS read_status,

        update_method~abapname        AS update_fm,
        update_method~modelonly       AS update_status,

        CASE
          WHEN dd02l~tabname IS NOT NULL THEN
*            create_method~refstruct
          dd02l~tabname
        END AS    main_db_table, "Create the field en overwrite it later

        CASE
          WHEN dd02l~tabname IS NOT NULL THEN
            tojtt~ntext
        END AS key_fields,    "This is dirty. :) But for a tool like this OK.

        df14l~ps_posid                AS component,

        tojtb~crea_date               AS create_date,
        tojtb~version                 AS version,

        CASE
          WHEN logon_lang_tojtt~stext IS NOT NULL THEN
            logon_lang_tojtt~stext
          ELSE
            tojtb~name
        END AS logon_lang_tojtt_short_descr,

        tojtt~ntext                   AS long_description

      FROM tojtb

      LEFT JOIN tojtt
        ON tojtt~name     = tojtb~name AND
           tojtt~language = 'E'

      LEFT JOIN swotlv AS create_method
        ON create_method~lobjtype  = tojtb~name AND
           create_method~abaptype  = 'F' AND
           create_method~verbtype  = 'M' AND
           create_method~verb      LIKE 'CREATE%'
           AND
           NOT (
             create_method~abapname = 'FVRC_RA_WRITE' OR "Not supported.
             create_method~abapname = 'SWO_DIALOG_OBJTYPE_INSERT' OR
             create_method~abapname = 'FVBOR_RU_MAINTAIN_DARK_SINGLE' "Contains non-DDIC field
           )


      LEFT JOIN dd02l
        ON dd02l~tabname  = create_method~refstruct AND
           dd02l~tabclass = 'TRANSP'

      LEFT JOIN swotlv AS read_method
        ON read_method~lobjtype  = tojtb~name AND
           read_method~abaptype  = 'F' AND
           read_method~verbtype  = 'M' AND
           ( read_method~verb    = 'GETDETAIL' OR
             read_method~verb    LIKE 'GET%DET%LIST')
           AND
           NOT (
             read_method~abapname = 'BAPI_SALESORDER_GETLIST'   "Not a detail bapi - Incorrect BAPI
           )

      LEFT JOIN swotlv AS update_method
        ON update_method~lobjtype  = tojtb~name AND
           update_method~abaptype  = 'F' AND
           update_method~verbtype  = 'M' AND
           ( update_method~verb      = 'EDIT' OR
             update_method~verb      = 'CHANGE' OR
             update_method~verb      LIKE 'CHANGE%' OR
             update_method~verb      = 'SAVEDATA' )
           AND
           NOT (
             update_method~abapname = 'ASSET_MASTERRECORD_MAINTENANCE' OR "Support this FM in a later version
             update_method~abapname = 'BAPI_SALESADDIREQ_CHG_STATUS' OR
             update_method~abapname = 'SWO_DIALOG_OBJTYPE_EDIT' OR
             update_method~abapname = 'CN_WF_PURCHASE_ORDER_CHANGE'  "Is not a background function module
           )

      LEFT JOIN tadir
        ON tadir~pgmid     = 'R3TR' AND
           tadir~object    = 'SOBJ' AND
           tadir~obj_name  = tojtb~name

      LEFT JOIN tdevc
        ON tdevc~devclass = tadir~devclass

      LEFT JOIN df14l
        ON df14l~fctr_id = tdevc~component

      LEFT JOIN tojtt AS logon_lang_tojtt
        ON logon_lang_tojtt~name     = tojtb~name AND
           logon_lang_tojtt~language = @sy-langu

      INTO CORRESPONDING FIELDS OF TABLE @rt_business_object_2

      WHERE
        (
          ( create_method~abapname  IS NOT NULL AND
            create_method~abapname  <> '' )
          OR
          ( read_method~abapname    IS NOT NULL AND
            read_method~abapname    <> '' )
          OR
          ( update_method~abapname  IS NOT NULL AND
            update_method~abapname  <> '' )
        )

      ORDER BY
        tojtt~stext,
        tojtb~name.


    "Read key fields
    SELECT
        swotlv~lobjtype,
        swotlv~editorder,
        swotlv~verb,
        swotlv~refstruct,
        swotlv~reffield

      FROM swotlv

      FOR ALL ENTRIES IN @rt_business_object_2

      WHERE
        swotlv~lobjtype  = @rt_business_object_2-name AND
        swotlv~verbtype  = 'K'

      INTO TABLE @DATA(lt_key_fields).

    SORT lt_key_fields
      BY lobjtype editorder.

    "Update object list
    LOOP AT rt_business_object_2
      ASSIGNING FIELD-SYMBOL(<ls_bus_obj>).

      CLEAR:
       <ls_bus_obj>-main_db_table,
       <ls_bus_obj>-key_fields.

      READ TABLE lt_key_fields
        WITH KEY lobjtype = <ls_bus_obj>-name
        TRANSPORTING NO FIELDS.

      DATA(lv_index) = sy-tabix.

      LOOP AT lt_key_fields
        ASSIGNING FIELD-SYMBOL(<ls_key_field>)
        FROM lv_index.

        IF <ls_key_field>-lobjtype <>  <ls_bus_obj>-name.
          EXIT.
        ENDIF.

        IF <ls_bus_obj>-key_fields IS INITIAL.
          <ls_bus_obj>-main_db_table = <ls_key_field>-refstruct.
        ELSE.
          <ls_bus_obj>-key_fields = <ls_bus_obj>-key_fields && |, |.
        ENDIF.

        <ls_bus_obj>-key_fields =
          <ls_bus_obj>-key_fields && <ls_key_field>-reffield.

      ENDLOOP.

      "Check table
      IF <ls_bus_obj>-main_db_table IS NOT INITIAL.

        SELECT SINGLE dd02l~tabname
          FROM dd02l
          WHERE
            dd02l~tabname = @<ls_bus_obj>-main_db_table AND
            dd02l~tabclass = 'TRANSP'
          INTO @DATA(ls_dd02l).

        IF sy-subrc <> 0.

          CLEAR:
            <ls_bus_obj>-main_db_table,
            <ls_bus_obj>-key_fields.

        ENDIF.

      ENDIF.

    ENDLOOP.

    "Add extra business objects
    add_extra_bo_s(
      CHANGING ct_business_object = rt_business_object_2 ).

    "Sort
    SORT rt_business_object_2
      BY short_description
         name
         read_fm
         create_fm
         update_fm.


    "Set unique id
    LOOP AT rt_business_object_2
      ASSIGNING <ls_bus_obj>.

      "Set index
      <ls_bus_obj>-id = sy-tabix.

    ENDLOOP.

  ENDMETHOD.

  METHOD add_extra_bo_s.

    "Material retail
    READ TABLE ct_business_object
      WITH KEY name = 'BUS1001'
      INTO DATA(ls_business_object).

    IF sy-subrc = 0.

      ls_business_object-source        = 'Added'.
      ls_business_object-create_fm     = 'BAPI_MATERIAL_SAVEDATA'.
      ls_business_object-update_fm     = 'BAPI_MATERIAL_SAVEDATA'.
      ls_business_object-update_status = ''.

      APPEND ls_business_object
        TO ct_business_object.

    ENDIF.

    "Material retail
    READ TABLE ct_business_object
      WITH KEY name = 'BUS1001'
      INTO ls_business_object.

    IF sy-subrc = 0.

      ls_business_object-source             = 'Added'.
      ls_business_object-short_description  = 'Material retail'.
      ls_business_object-create_fm          = 'BAPI_MATERIAL_SAVEDATA'.
      ls_business_object-update_fm          = 'BAPI_MATERIAL_MAINTAINDATA_RT'.
      ls_business_object-update_status      = ''.

      APPEND ls_business_object
        TO ct_business_object.

    ENDIF.

    "Sales order
    READ TABLE ct_business_object
      WITH KEY name = 'BUS2032'
      INTO ls_business_object.

    IF sy-subrc = 0.

      ls_business_object-source             = 'Added'.
      ls_business_object-create_fm          = 'BAPI_SALESORDER_CREATEFROMDAT2'.
      ls_business_object-read_fm            = 'BAPISDORDER_GETDETAILEDLIST'.
      ls_business_object-update_fm          = 'BAPI_SALESORDER_CHANGE'.

      APPEND ls_business_object
        TO ct_business_object.

    ENDIF.

  ENDMETHOD.

  METHOD show_bo_list.

    "Display Popup screen
    DATA:
      lt_return_tab TYPE STANDARD TABLE OF ddshretval.

    DATA(lt_field_tab) = create_catalog( it_business_object_2 ).

    TYPES:
      BEGIN OF lts_data,
        line TYPE c LENGTH 80,
      END OF lts_data,
      ltt_data TYPE STANDARD TABLE OF lts_data.

    DATA:
      lt_data TYPE ltt_data.

    LOOP AT it_business_object_2
      ASSIGNING FIELD-SYMBOL(<ls_business_object>).

      LOOP AT lt_field_tab
        ASSIGNING FIELD-SYMBOL(<ls_field>).

        ASSIGN COMPONENT <ls_field>-lfieldname
          OF STRUCTURE <ls_business_object>
          TO FIELD-SYMBOL(<lv_value>).

        APPEND INITIAL LINE TO lt_data
          ASSIGNING FIELD-SYMBOL(<ls_data>).

        <ls_data>-line = <lv_value>.

      ENDLOOP.

    ENDLOOP.

    CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
      EXPORTING
        retfield        = 'ID'
        dynpprog        = sy-repid
        dynpnr          = sy-dynnr
        value_org       = 'C'
      TABLES
        value_tab       = lt_data
        field_tab       = lt_field_tab
        return_tab      = lt_return_tab
      EXCEPTIONS
        parameter_error = 1
        no_values_found = 2
        OTHERS          = 3.

    ASSIGN lt_return_tab[ 1 ]
      TO FIELD-SYMBOL(<ls_return>).

    IF <ls_return> IS NOT ASSIGNED.
      RETURN.
    ENDIF.

    DATA lv_id TYPE tojtb-winhlpind.
    lv_id  = <ls_return>-fieldval.

    ASSIGN it_business_object_2[
      id = lv_id ]
      TO FIELD-SYMBOL(<ls_bus_obj>).

    rs_business_object-create_bapi        = <ls_bus_obj>-create_fm.
    rs_business_object-read_bapi          = <ls_bus_obj>-read_fm.
    rs_business_object-update_bapi        = <ls_bus_obj>-update_fm.

    rs_business_object-component          = <ls_bus_obj>-component.

    rs_business_object-bo_name            = <ls_bus_obj>-short_description.
    rs_business_object-main_db_table_name = <ls_bus_obj>-main_db_table.
    rs_business_object-bor_object_type_name = <ls_bus_obj>-name.

  ENDMETHOD.

  METHOD show_module_abbrev_list.

    "Display Popup screen
    DATA:
      lt_return_tab TYPE STANDARD TABLE OF ddshretval.

    DATA:
      lt_field_tab TYPE STANDARD TABLE OF dfies WITH DEFAULT KEY.

    TYPES:
      BEGIN OF lts_data,
        module_abbrev TYPE swotlv-abapname,
      END OF lts_data,
      ltt_data TYPE STANDARD TABLE OF lts_data.

    DATA:
      lt_data TYPE ltt_data.

    SPLIT iv_component AT '-'
      INTO TABLE lt_data.

    CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
      EXPORTING
        retfield        = 'MODULE_ABBREV'
        dynpprog        = sy-repid
        dynpnr          = sy-dynnr
        window_title    = 'Select module abbreviation'
        value_org       = 'S'
      TABLES
        value_tab       = lt_data
        field_tab       = lt_field_tab
        return_tab      = lt_return_tab
      EXCEPTIONS
        parameter_error = 1
        no_values_found = 2
        OTHERS          = 3.

    ASSIGN lt_return_tab[ 1 ]
      TO FIELD-SYMBOL(<ls_return>).

    IF <ls_return> IS NOT ASSIGNED.
      RETURN.
    ENDIF.

    rv_module_abbrev = <ls_return>-fieldval.

  ENDMETHOD.

  METHOD create_catalog.

    "Build initial field catalog
    DATA:
      lt_field_tab_2 TYPE STANDARD TABLE OF dfies WITH DEFAULT KEY.

    DATA(lr_table_descr) =
      CAST cl_abap_tabledescr(
        cl_abap_structdescr=>describe_by_data(
          p_data = it_business_object_2 ) ).

    DATA(lr_struct_descr) =
      CAST cl_abap_structdescr(
        lr_table_descr->get_table_line_type( ) ).

    DATA(lt_components) = lr_struct_descr->get_components( ).

    "Loop at the fields
    LOOP AT lt_components
      ASSIGNING FIELD-SYMBOL(<ls_component>).

      "Get ddic line
      DATA(lr_element) = CAST cl_abap_elemdescr( <ls_component>-type ).

      DATA(ls_ddic) = lr_element->get_ddic_field( ).

      ls_ddic-leng = ls_ddic-outputlen.

      "Add ddic line
      APPEND INITIAL LINE TO rt_dfies_tab
        ASSIGNING FIELD-SYMBOL(<ls_field>).

      MOVE-CORRESPONDING ls_ddic TO <ls_field>.

      <ls_field>-fieldname = <ls_component>-name.

      CLEAR <ls_field>-tabname.

      CLEAR <ls_field>-precfield.

      <ls_field>-lfieldname = <ls_component>-name.

      <ls_field>-mask = 'X'.

      <ls_field>-comptype = 'E'.

      <ls_field>-position   = sy-tabix.

    ENDLOOP.

    "Change field catalog
    LOOP AT rt_dfies_tab
      ASSIGNING <ls_field>.

      CASE <ls_field>-fieldname.

        WHEN 'SOURCE'.

          <ls_field>-reptext       = 'Source'.
          <ls_field>-scrtext_s     = 'Source'.
          <ls_field>-scrtext_m     = 'Source'.
          <ls_field>-scrtext_l     = 'Source'.

          <ls_field>-leng	         = 15.
          <ls_field>-outputlen     = 15.

        WHEN 'MODULE_ABBREV'.

        WHEN 'NAME'.

          <ls_field>-reptext       = 'Object type'.
          <ls_field>-scrtext_s     = 'Obj. type'.
          <ls_field>-scrtext_m     = 'Object type'.
          <ls_field>-scrtext_l     = 'Object type'.

        WHEN 'SHORT_DESCRIPTION'.

          <ls_field>-reptext       = 'Short description (English)'.
          <ls_field>-scrtext_s     = 'Short descr. (En)'.
          <ls_field>-scrtext_m     = 'Short descr. (En.)'.
          <ls_field>-scrtext_l     = 'Short description (English)'.

        WHEN 'CREATE_FM'.

          <ls_field>-reptext       = 'Create BAPI'.
          <ls_field>-scrtext_s     = 'Create BAPI'.
          <ls_field>-scrtext_m     = 'Create BAPI'.
          <ls_field>-scrtext_l     = 'Create BAPI'.

        WHEN 'CREATE_STATUS'.

          <ls_field>-reptext       = 'Create status'.
          <ls_field>-scrtext_s     = 'Create status'.
          <ls_field>-scrtext_m     = 'Create status'.
          <ls_field>-scrtext_l     = 'Create status'.

        WHEN 'READ_FM'.

          <ls_field>-reptext       = 'Read BAPI'.
          <ls_field>-scrtext_s     = 'Read BAPI'.
          <ls_field>-scrtext_m     = 'Read BAPI'.
          <ls_field>-scrtext_l     = 'Read BAPI'.

        WHEN 'READ_STATUS'.

          <ls_field>-reptext       = 'Read status'.
          <ls_field>-scrtext_s     = 'Read status'.
          <ls_field>-scrtext_m     = 'Read status'.
          <ls_field>-scrtext_l     = 'Read status'.

        WHEN 'UPDATE_FM'.

          <ls_field>-reptext       = 'Update BAPI'.
          <ls_field>-scrtext_s     = 'Update BAPI'.
          <ls_field>-scrtext_m     = 'Update BAPI'.
          <ls_field>-scrtext_l     = 'Update BAPI'.

        WHEN 'UPDATE_STATUS'.

          <ls_field>-reptext       = 'Update status'.
          <ls_field>-scrtext_s     = 'Update status'.
          <ls_field>-scrtext_m     = 'Update status'.
          <ls_field>-scrtext_l     = 'Update status'.

        WHEN 'MAIN_DB_TABLE'.

          <ls_field>-reptext       = 'Main DB table'.
          <ls_field>-scrtext_s     = 'Main DB table'.
          <ls_field>-scrtext_m     = 'Main DB table'.
          <ls_field>-scrtext_l     = 'Main DB table'.

        WHEN 'KEY_FIELDS'.

          <ls_field>-reptext       = 'Key fields'.
          <ls_field>-scrtext_s     = 'Key fields'.
          <ls_field>-scrtext_m     = 'Key fields'.
          <ls_field>-scrtext_l     = 'Key fields'.

        WHEN 'CREATE_DATE'.

          <ls_field>-reptext       = 'Create date'.
          <ls_field>-scrtext_s     = 'Create date'.
          <ls_field>-scrtext_m     = 'Create date'.
          <ls_field>-scrtext_l     = 'Create date'.

        WHEN 'VERSION'.

          <ls_field>-reptext       = 'Version'.
          <ls_field>-scrtext_s     = 'Version'.
          <ls_field>-scrtext_m     = 'Version'.
          <ls_field>-scrtext_l     = 'Version'.

        WHEN 'LOGON_LANG_TOJTT_SHORT_DESCR'.

          <ls_field>-reptext       = |Short descript. ({ sy-langu ALPHA = OUT })|.
          <ls_field>-scrtext_s     = |Short descr. ({ sy-langu ALPHA = OUT })|.
          <ls_field>-scrtext_m     = |Short descr. ({ sy-langu ALPHA = OUT })|.
          <ls_field>-scrtext_l     = |Short descr. ({ sy-langu ALPHA = OUT })|.

        WHEN 'LONG_DESCRIPTION'.

          <ls_field>-reptext       = 'Long description'.
          <ls_field>-scrtext_s     = 'Long description'.
          <ls_field>-scrtext_m     = 'Long description'.
          <ls_field>-scrtext_l     = 'Long description'.

        WHEN 'INDX'.

          <ls_field>-reptext       = 'Index'.
          <ls_field>-scrtext_s     = 'Index'.
          <ls_field>-scrtext_m     = 'Index'.
          <ls_field>-scrtext_l     = 'Index'.

      ENDCASE.

    ENDLOOP.

    "Rename field name for field catalog
    DATA lv_number TYPE n LENGTH 4.

    LOOP AT rt_dfies_tab
      ASSIGNING <ls_field>.

      lv_number =  lv_number + 1.

      <ls_field>-position = lv_number.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS zab_abap_code_bo DEFINITION. "This class is generiek for ABAP programs code and ABAP classes code

  PUBLIC SECTION.

    TYPES:
      gtt_lines                  TYPE STANDARD TABLE OF string WITH EMPTY KEY,

      gtv_variable_name          TYPE c LENGTH 30,
      gtv_data_element_name      TYPE rollname,
      gtv_data_element_path_name TYPE string.

    METHODS:
      get_code
        IMPORTING iv_code_level  TYPE i
        RETURNING VALUE(rv_code) TYPE string
        RAISING   zab_return_exc,
      get_code_lines
        IMPORTING iv_code_level   TYPE i
        RETURNING VALUE(rt_lines) TYPE gtt_lines
        RAISING   zab_return_exc,
      add_code_line
        IMPORTING iv_line TYPE string,
      add_code_lines
        IMPORTING it_lines TYPE gtt_lines,
      append_to_last_line
        IMPORTING iv_text TYPE string
        RAISING   zab_return_exc.

  PROTECTED SECTION.

    METHODS:
      generate_code
        IMPORTING iv_code_level TYPE i
        RAISING   zab_return_exc.  "To be implemented by sub class


    DATA:
*      gt_comment_lines TYPE STANDARD TABLE OF string,
      gt_code_lines    TYPE gtt_lines.

ENDCLASS.

CLASS zab_abap_code_bo IMPLEMENTATION.

  METHOD get_code_lines.

    generate_code(
      iv_code_level = iv_code_level ).

    rt_lines = gt_code_lines.

  ENDMETHOD.

  METHOD get_code.

    generate_code(
      iv_code_level = iv_code_level ).

    LOOP AT gt_code_lines
      ASSIGNING FIELD-SYMBOL(<lv_line>).

      IF sy-tabix = 1.

        rv_code = <lv_line>.

      ELSE.

        rv_code = rv_code &&
          cl_abap_char_utilities=>newline &&
          <lv_line>.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD generate_code.
  ENDMETHOD.

  METHOD add_code_line.

    APPEND iv_line
      TO gt_code_lines.

  ENDMETHOD.

  METHOD add_code_lines.

    APPEND LINES OF it_lines
      TO gt_code_lines.

  ENDMETHOD.

  METHOD append_to_last_line.

    DATA(lv_last_line_index) = lines( gt_code_lines ).

    IF lv_last_line_index = 0.

      "Code error
      DATA(lr_return_exc) = zab_return_exc=>create_by_text(
        iv_message    = 'Code contains no lines.' ).

      RAISE EXCEPTION lr_return_exc.

    ENDIF.

    READ TABLE gt_code_lines
      ASSIGNING FIELD-SYMBOL(<lv_last_line>)
      INDEX lv_last_line_index.

    <lv_last_line> = <lv_last_line> && iv_text.

  ENDMETHOD.

ENDCLASS.

CLASS zab_abap_type_code_bo DEFINITION
  INHERITING FROM zab_abap_code_bo.

  PUBLIC SECTION.

    TYPES:
      gtv_id                   TYPE i,
      gtv_kind                 TYPE abap_typecategory,

      gtv_table_access_type    TYPE c LENGTH 20,
      gtv_table_key_definition TYPE c LENGTH 20,
      gtv_table_key_category   TYPE c LENGTH 20,

      BEGIN OF gts_table,
        access_type    TYPE gtv_table_access_type,
        key_definition TYPE gtv_table_key_definition,
        key_category   TYPE gtv_table_key_category,
      END OF gts_table,

      BEGIN OF gts_type,
        id           TYPE gtv_id,
        parent_id    TYPE gtv_id,
        name         TYPE typename,
        kind         TYPE gtv_kind,
        data_type    TYPE rs38l_typ,
        table        TYPE gts_table,
        comment_text TYPE string,
      END OF gts_type,

      gtt_type_list TYPE STANDARD TABLE OF gts_type WITH EMPTY KEY.

    CONSTANTS:
      gcc_kind_value                 TYPE gtv_kind VALUE cl_abap_typedescr=>kind_elem,
      gcc_kind_structure             TYPE gtv_kind VALUE cl_abap_typedescr=>kind_struct,
      gcc_kind_table                 TYPE gtv_kind VALUE cl_abap_typedescr=>kind_table,
      gcc_kind_ref                   TYPE gtv_kind VALUE cl_abap_typedescr=>kind_ref,
      gcc_kind_class                 TYPE gtv_kind VALUE cl_abap_typedescr=>kind_class,

      gcc_table_access_type_standard TYPE gtv_table_access_type    VALUE 'STANDARD',
      gcc_table_key_def_default      TYPE gtv_table_key_definition VALUE 'DEFAULT',
      gcc_table_key_cat_non_unique   TYPE gtv_table_key_category   VALUE 'NON-UNIQUE'.

    CLASS-METHODS:
      create_instance_by_data
        IMPORTING is_data            TYPE gtt_type_list
        RETURNING VALUE(rr_instance) TYPE REF TO zab_abap_type_code_bo.

    METHODS:
      get_code REDEFINITION,
      get_code_lines REDEFINITION.

  PROTECTED SECTION.

    DATA:
      gs_data  TYPE gtt_type_list.

    METHODS:
      generate_code REDEFINITION,
      generate_code_level
        IMPORTING parent_id TYPE gtv_id
                  level     TYPE i
        RAISING   zab_return_exc.

ENDCLASS.

CLASS zab_abap_type_code_bo IMPLEMENTATION.

  METHOD create_instance_by_data.

    rr_instance = NEW #( ).

    rr_instance->gs_data = is_data.

  ENDMETHOD.

  METHOD get_code.

    generate_code(
      iv_code_level = iv_code_level ).

  ENDMETHOD.

  METHOD get_code_lines.

    generate_code(
      iv_code_level = iv_code_level ).

    rt_lines = gt_code_lines.

  ENDMETHOD.

  METHOD generate_code.

    REFRESH gt_code_lines.

    me->add_code_line(
      zab_abap_text_bo=>get_spaces(
        iv_tab_character_count = 2
        iv_tab_count           = iv_code_level ) &&
      |TYPES:| ).

    generate_code_level(
      parent_id = 0
      level     = iv_code_level + 1 ).

  ENDMETHOD.

  METHOD generate_code_level.

    DATA:
      lv_level_child TYPE i,
      lv_line        TYPE string.

    lv_level_child = level.

    DATA(lv_spaces) = zab_abap_text_bo=>get_spaces(
      iv_tab_character_count = 2
      iv_tab_count           = lv_level_child ).

    LOOP AT gs_data
      ASSIGNING FIELD-SYMBOL(<ls_type>)
      WHERE parent_id = parent_id.

      CASE <ls_type>-kind.

        WHEN gcc_kind_structure.

          me->add_code_line(
            lv_spaces && |BEGIN OF | && to_lower( <ls_type>-name ) && |,| ).

          generate_code_level(
            parent_id = <ls_type>-id
            level     = lv_level_child + 1 ).

          IF parent_id = 0.
            me->add_code_line( lv_spaces && |END OF | && to_lower( <ls_type>-name ) && |.| ).
          ELSE.
            me->add_code_line( lv_spaces && |END OF | && to_lower( <ls_type>-name ) && |,| ).
          ENDIF.

        WHEN gcc_kind_value.

          DATA(lv_name) = to_lower( <ls_type>-name ).

          DATA(lv_name_2) =
            zab_abap_text_bo=>add_trailing_space(
              iv_text   = lv_name
              iv_length = 30 ).

          lv_line =  lv_spaces &&
            lv_name_2 &&
            | TYPE | &&
            to_lower( <ls_type>-data_type ).

          IF parent_id = 0.

            lv_line = lv_line && |.|.

          ELSE.

            lv_line = lv_line && |,|.

          ENDIF.

          IF <ls_type>-comment_text IS NOT INITIAL.

            lv_line = lv_line && |  "{ <ls_type>-comment_text }|.

          ENDIF.

          me->add_code_line( lv_line ).

        WHEN gcc_kind_table.

          lv_name = to_lower( <ls_type>-name ).

          lv_name_2 =
            zab_abap_text_bo=>add_trailing_space(
              iv_text   = lv_name
              iv_length = 30 ).

          lv_line =  lv_spaces &&
            lv_name_2 &&
            | TYPE|.

          CASE <ls_type>-table-access_type.

            WHEN gcc_table_access_type_standard.
              lv_line =  lv_line && | STANDARD|.

            WHEN OTHERS.

              "Code error
              DATA(lr_return_exc) = zab_return_exc=>create_by_text(
                iv_message    = |Table access type { <ls_type>-table-access_type } is not supported.| ).

              RAISE EXCEPTION lr_return_exc.

          ENDCASE.

          lv_line = lv_line && | TABLE OF |.

          lv_line = lv_line && to_lower( <ls_type>-data_type ).

          lv_line = lv_line && cl_abap_char_utilities=>newline.

          lv_line = lv_line &&
            |{ lv_spaces }                                    WITH|.

          lv_line = lv_line && | | && <ls_type>-table-key_category.

          lv_line = lv_line && | | && <ls_type>-table-key_definition.

          lv_line = lv_line && | KEY|.

          IF parent_id = 0.

            lv_line = lv_line && |.|.

          ELSE.

            lv_line = lv_line && |,|.

          ENDIF.

          me->add_code_line( lv_line ).


        WHEN gcc_kind_class.

          lv_name = to_lower( <ls_type>-name ).

          lv_name_2 =
            zab_abap_text_bo=>add_trailing_space(
              iv_text   = lv_name
              iv_length = 30 ).

          lv_line =  lv_spaces &&
            lv_name_2 &&
            | TYPE REF TO | &&
            to_lower( <ls_type>-data_type ).

          IF parent_id = 0.

            lv_line = lv_line && |.|.

          ELSE.

            lv_line = lv_line && |,|.

          ENDIF.

          IF <ls_type>-comment_text IS NOT INITIAL.

            lv_line = lv_line && |  "{ <ls_type>-comment_text }|.

          ENDIF.

          me->add_code_line( lv_line ).

        WHEN gcc_kind_ref.

          lv_name = to_lower( <ls_type>-name ).

          lv_name_2 =
            zab_abap_text_bo=>add_trailing_space(
              iv_text   = lv_name
              iv_length = 30 ).

          lv_line =
            lv_spaces &&
            lv_name_2 &&
            | TYPE REF TO | &&
            to_lower( <ls_type>-data_type ).

          IF parent_id = 0.

            lv_line = lv_line && |.|.

          ELSE.

            lv_line = lv_line && |,|.

          ENDIF.

          IF <ls_type>-comment_text IS NOT INITIAL.

            lv_line = lv_line && |  "{ <ls_type>-comment_text }|.

          ENDIF.

          me->add_code_line( lv_line ).

        WHEN OTHERS.

          "Code error
          lr_return_exc = zab_return_exc=>create_by_text(
            iv_message    = |Data kind { <ls_type>-kind } is not supported.| ).

          RAISE EXCEPTION lr_return_exc.

      ENDCASE.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS zab_abap_data_code_bo DEFINITION
  INHERITING FROM zab_abap_type_code_bo.

  PUBLIC SECTION.

    CLASS-METHODS:
      create_data_code_by_data
        IMPORTING it_type_list       TYPE gtt_type_list
        RETURNING VALUE(rr_instance) TYPE REF TO zab_abap_data_code_bo.

  PROTECTED SECTION.

    METHODS:
      generate_code REDEFINITION.

ENDCLASS.

CLASS zab_abap_data_code_bo IMPLEMENTATION.

  METHOD create_data_code_by_data.

    rr_instance = NEW #( ).

    rr_instance->gs_data = it_type_list.

  ENDMETHOD.

  METHOD generate_code.

    REFRESH gt_code_lines.

    DATA(lv_spaces) = zab_abap_text_bo=>get_spaces(
      iv_tab_character_count = 2
      iv_tab_count           = iv_code_level ).

    me->add_code_line( |{ lv_spaces }DATA:| ).

    generate_code_level(
      parent_id = 0
      level     = iv_code_level + 1 ).

  ENDMETHOD.

ENDCLASS.

CLASS zab_abap_method_code_bo DEFINITION
  INHERITING FROM zab_abap_code_bo.

  PUBLIC SECTION.

    TYPES:

      gtv_type           TYPE c LENGTH 20,
      gtv_parameter_type TYPE c LENGTH 20,
      gtv_typing_code    TYPE c LENGTH 15,

      BEGIN OF gts_parameter,
        type        TYPE gtv_parameter_type,
        name        TYPE seosconame,
        typing_code TYPE gtv_typing_code,
        data_type   TYPE rs38l_typ,
      END OF gts_parameter,
      gtt_parameters_data TYPE STANDARD TABLE OF gts_parameter WITH EMPTY KEY,

      BEGIN OF gts_data,
        type                 TYPE gtv_type,
        name                 TYPE seocpdname,
        parameters           TYPE gtt_parameters_data,
        alias_component_name TYPE c LENGTH 100,
        code_list            TYPE gtt_lines,
      END OF gts_data.

    CONSTANTS:
      gcc_class_method_type       TYPE gtv_type VALUE 'class method',
      gcc_instance_method_type    TYPE gtv_type VALUE 'instance method',

      gcc_importing_param_type    TYPE gtv_parameter_type VALUE 'importing',
      gcc_changing_param_type     TYPE gtv_parameter_type VALUE 'changing',
      gcc_returning_param_type    TYPE gtv_parameter_type VALUE 'returning',
      gcc_exception_type          TYPE gtv_parameter_type VALUE 'exception',

      gcc_type_typing_code        TYPE gtv_typing_code VALUE 'TYPE',
      gcc_type_ref_to_typing_code TYPE gtv_typing_code VALUE 'TYPE REF TO'.

    CLASS-METHODS:
      create_instance_by_data
        IMPORTING is_data            TYPE gts_data
        RETURNING VALUE(rr_instance) TYPE REF TO zab_abap_method_code_bo.

    METHODS:
      get_definition_code
        IMPORTING iv_code_level   TYPE i
        RETURNING VALUE(rt_lines) TYPE gtt_lines
        RAISING   zab_return_exc,
      get_implementation_code
        RETURNING VALUE(rt_lines) TYPE gtt_lines.

  PROTECTED SECTION.

    DATA:
      gs_data TYPE gts_data.

    METHODS:
      generate_code REDEFINITION.

ENDCLASS.

CLASS zab_abap_method_code_bo IMPLEMENTATION.

  METHOD create_instance_by_data.

    rr_instance = NEW #( ).

    rr_instance->gs_data = is_data.

  ENDMETHOD.

  METHOD generate_code.
    "No code needed for this sub class.
  ENDMETHOD.

  METHOD get_definition_code.

*  Example:
*    CLASS-METHODS:
*      get_instance_by_key
*        IMPORTING is_key             TYPE gts_key
*        RETURNING VALUE(rr_material) TYPE REF TO zcl_mm_material.

    REFRESH gt_code_lines.

    DATA lv_line TYPE string.

    DATA(lv_space) = zab_abap_text_bo=>get_spaces(
      iv_tab_character_count = 2
      iv_tab_count           = iv_code_level  ).

    CASE gs_data-type.

      WHEN gcc_class_method_type.

        add_code_line( |{ lv_space }CLASS-METHODS:| ).

      WHEN gcc_instance_method_type.

        add_code_line( |{ lv_space }METHODS:| ).

      WHEN OTHERS.

        "Code error
        DATA(lr_return_exc) = zab_return_exc=>create_by_text(
          iv_message    = |Data type { gs_data-type } is not supported.| ).

        RAISE EXCEPTION lr_return_exc.

    ENDCASE.

    add_code_line( |{ lv_space }  | && to_lower( gs_data-name ) ).

    "Importing parameters
    DATA lv_counter TYPE i.

    lv_counter = 0.

    LOOP AT gs_data-parameters
      ASSIGNING FIELD-SYMBOL(<ls_parameter>)
      WHERE type = gcc_importing_param_type.



      lv_counter = lv_counter + 1.

      IF lv_counter = 1.
        lv_line = |{ lv_space }    IMPORTING |.
      ELSE.
        lv_line = |{ lv_space }              |.
      ENDIF.

      DATA(lv_name) = zab_abap_text_bo=>add_trailing_space(
        iv_text = <ls_parameter>-name
        iv_length = 30 ).

      lv_line = lv_line && lv_name && | TYPE | && <ls_parameter>-data_type.

      add_code_line( lv_line ).

    ENDLOOP.

    "Changing parameters
    lv_counter = 0.

    LOOP AT gs_data-parameters
      ASSIGNING <ls_parameter>
      WHERE type = gcc_changing_param_type.

      lv_counter = lv_counter + 1.

      IF lv_counter = 1.
        lv_line = |{ lv_space }    CHANGING  |.
      ELSE.
        lv_line = |{ lv_space }              |.
      ENDIF.

      lv_name = zab_abap_text_bo=>add_trailing_space(
        iv_text = <ls_parameter>-name
        iv_length = 30 ).

      lv_line = lv_line && lv_name && | TYPE | && <ls_parameter>-data_type.

      add_code_line( lv_line ).

    ENDLOOP.

    "Returning parameters
    LOOP AT gs_data-parameters
      ASSIGNING <ls_parameter>
      WHERE type = gcc_returning_param_type.

      lv_name =
        |VALUE(| &&
        <ls_parameter>-name && |)|.

      lv_name =
        zab_abap_text_bo=>add_trailing_space(
          iv_text = lv_name
          iv_length = 30 ).

      lv_line =
        |{ lv_space }    RETURNING | &&
        lv_name &&
        | | && <ls_parameter>-typing_code && | | && <ls_parameter>-data_type.

      add_code_line( lv_line ).

    ENDLOOP.

    "Exceptions
    lv_counter = 0.

    LOOP AT gs_data-parameters
      ASSIGNING <ls_parameter>
      WHERE type =     gcc_exception_type.

      lv_counter = lv_counter + 1.

      IF lv_counter = 1.
        lv_line = |{ lv_space }    RAISING   |.
      ELSE.
        lv_line = |{ lv_space }              |.
      ENDIF.

      lv_line = lv_line && <ls_parameter>-name.

      add_code_line( lv_line ).

    ENDLOOP.

    append_to_last_line( |.| ).

    rt_lines = gt_code_lines.

  ENDMETHOD.

  METHOD get_implementation_code.

    REFRESH gt_code_lines.

    add_code_line( |  METHOD | && to_lower( gs_data-name ) && |.| ).

    LOOP AT gs_data-code_list
      ASSIGNING FIELD-SYMBOL(<ls_code>).

      add_code_line( <ls_code> ).

    ENDLOOP.

    add_code_line( || ).

    add_code_line( |  ENDMETHOD.| ).

    rt_lines = gt_code_lines.

  ENDMETHOD.

ENDCLASS.

CLASS zab_abap_variable_bo DEFINITION.

  PUBLIC SECTION.

    TYPES:
      gtv_variable_name   TYPE c LENGTH 30,
      gtv_life_time       TYPE c LENGTH 20,
      gtv_variable_kind   LIKE cl_abap_typedescr=>kind,
      gtv_changeable_kind TYPE c LENGTH 20.

    CONSTANTS:
      gcc_class_life_time           TYPE gtv_life_time VALUE 'CLASS',
      gcc_method_life_time          TYPE gtv_life_time VALUE 'METHOD',
      gcc_importing_param_life_time TYPE gtv_life_time VALUE 'IMPORTING',
      gcc_exporting_param_life_time TYPE gtv_life_time VALUE 'EXPORTING',
      gcc_changing_param_life_time  TYPE gtv_life_time VALUE 'CHANGING',
      gcc_returning_param_life_time TYPE gtv_life_time VALUE 'RETURNING',
      gcc_structure_field_life_time TYPE gtv_life_time VALUE 'STRUCTURE_FIELD',

      gcc_kind_table                LIKE cl_abap_typedescr=>kind  VALUE cl_abap_typedescr=>kind_table,
      gcc_kind_structure            LIKE cl_abap_typedescr=>kind  VALUE cl_abap_typedescr=>kind_struct,
      gcc_kind_value                LIKE cl_abap_typedescr=>kind  VALUE cl_abap_typedescr=>kind_elem,
      gcc_kind_ref                  LIKE cl_abap_typedescr=>kind  VALUE cl_abap_typedescr=>kind_ref,

      gcc_type_chng_kind            TYPE gtv_changeable_kind VALUE 'TYPE',
      gcc_constant_chng_kind        TYPE gtv_changeable_kind VALUE 'CONSTANT',
      gcc_static_chng_kind          TYPE gtv_changeable_kind VALUE 'STATIC',
      gcc_variable_chng_kind        TYPE gtv_changeable_kind VALUE 'VARIABLE'.

ENDCLASS.


CLASS zab_abap_naming_bo DEFINITION
  INHERITING FROM zab_abap_variable_bo.

  PUBLIC SECTION.

    TYPES:
      gtv_naming_name TYPE c LENGTH 24,

      BEGIN OF gts_naming,
        life_time       TYPE gtv_life_time,
        variable_kind   TYPE gtv_variable_kind,
        changeable_kind TYPE gtv_changeable_kind,
        prefix          TYPE string,
        postfix         TYPE string,
      END OF gts_naming,
      gtt_naming TYPE STANDARD TABLE OF gts_naming.

    CONSTANTS:
      gcc_dsag_2016_short_naming TYPE gtv_naming_name VALUE 'DSAG 2016 SHORT',
      gcc_long_naming            TYPE gtv_naming_name VALUE 'DSAG 2016 LONG'.

    CLASS-METHODS class_constructor.

    CLASS-METHODS get_current_naming_name
      RETURNING VALUE(rv_current_naming_name) TYPE gtv_naming_name.

    CLASS-METHODS get_naming_list
      RETURNING VALUE(rt_naming_list) TYPE vrm_values.

    CLASS-METHODS get_instance
      RETURNING VALUE(rr_instance_bo) TYPE REF TO zab_abap_naming_bo.

    METHODS get_naming
      IMPORTING
                life_time          TYPE gtv_life_time
                variable_kind      TYPE gtv_variable_kind
                changeable_kind    TYPE gtv_changeable_kind
      RETURNING VALUE(rs_naming_s) TYPE gts_naming
      RAISING   zab_return_exc.


    CLASS-METHODS set_naming_name
      IMPORTING iv_naming_name TYPE gtv_naming_name.

  PROTECTED SECTION.

    CLASS-DATA:
      gv_default_naming_name TYPE gtv_naming_name VALUE gcc_dsag_2016_short_naming,

      gv_current_naming_name TYPE gtv_naming_name,

      gr_instance_bo         TYPE REF TO zab_abap_naming_bo.

    DATA gt_naming TYPE gtt_naming.

    METHODS create_naming_list.

ENDCLASS.

CLASS zab_abap_naming_bo IMPLEMENTATION.

  METHOD class_constructor.

    set_naming_name(
      iv_naming_name = gv_default_naming_name ).

  ENDMETHOD.

  METHOD get_naming_list.

    rt_naming_list = VALUE #(
      (
        key = gcc_dsag_2016_short_naming
        text = 'DSAG 2016 short naming'
      )
      (
        key = gcc_long_naming
        text = 'Long naming'
      )

    ).

  ENDMETHOD.

  METHOD get_current_naming_name.

    rv_current_naming_name = gv_current_naming_name.

  ENDMETHOD.

  METHOD get_instance.

    rr_instance_bo = gr_instance_bo.

  ENDMETHOD.

  METHOD set_naming_name.

    CLEAR gr_instance_bo.

    gr_instance_bo = NEW #( ).

    gr_instance_bo->gv_current_naming_name = iv_naming_name.

    gr_instance_bo->create_naming_list( ).

  ENDMETHOD.

  METHOD get_naming.

    READ TABLE gt_naming
      WITH KEY
        life_time       = life_time
        variable_kind   = variable_kind
        changeable_kind = changeable_kind
      INTO rs_naming_s.

    IF sy-subrc <> 0.

      "Code error
      DATA(lr_return_exc) = zab_return_exc=>create_by_text(
        iv_message    = |Naming not found. Life time: { life_time }, variable kind: { variable_kind }, Changeable kind: { changeable_kind }.| ).

      RAISE EXCEPTION lr_return_exc.

    ENDIF.

  ENDMETHOD.

  METHOD create_naming_list.

    TYPES:
      gtv_convention_name TYPE c LENGTH 20.

*    DATA(lv_convention_name) = gcc_long_naming.
    DATA(lv_convention_name) = gv_current_naming_name.

    gt_naming = VALUE #(

      "**********************************************************
      "Structure field
      (
        life_time       = gcc_structure_field_life_time
        variable_kind   = cl_abap_typedescr=>kind_table
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      (
        life_time       = gcc_structure_field_life_time
        variable_kind   = cl_abap_typedescr=>kind_struct
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      (
        life_time       = gcc_structure_field_life_time
        variable_kind   = cl_abap_typedescr=>kind_elem
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      (
        life_time       = gcc_structure_field_life_time
        variable_kind   = cl_abap_typedescr=>kind_ref
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      (
        life_time       = gcc_structure_field_life_time
        variable_kind   = cl_abap_typedescr=>kind_elem
        changeable_kind = gcc_constant_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      (
        life_time       = gcc_structure_field_life_time
        variable_kind   = cl_abap_typedescr=>kind_elem
        changeable_kind = gcc_static_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      "**********************************************************
      "Class - Types
      (
        life_time       = gcc_class_life_time
        variable_kind   = cl_abap_typedescr=>kind_table
        changeable_kind = gcc_type_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'GTT_'
            WHEN gcc_dsag_2016_short_naming THEN 'T' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '_T' )
      )

      (
        life_time       = gcc_class_life_time
        variable_kind   = cl_abap_typedescr=>kind_struct
        changeable_kind = gcc_type_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'GTS_'
            WHEN gcc_dsag_2016_short_naming THEN 'T' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '_S' )
      )

      (
        life_time       = gcc_class_life_time
        variable_kind   = cl_abap_typedescr=>kind_elem
        changeable_kind = gcc_type_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'GTV_'
            WHEN gcc_dsag_2016_short_naming THEN 'T' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      (
        life_time       = gcc_class_life_time
        variable_kind   = cl_abap_typedescr=>kind_ref
        changeable_kind = gcc_type_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'GTR_'
            WHEN gcc_dsag_2016_short_naming THEN 'T' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      "**********************************************************
      "Class - Variables
      (
        life_time       = gcc_class_life_time
        variable_kind   = cl_abap_typedescr=>kind_table
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'GT_'
            WHEN gcc_dsag_2016_short_naming THEN '' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '_T' )
      )

      (
        life_time       = gcc_class_life_time
        variable_kind   = cl_abap_typedescr=>kind_struct
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'GS_'
            WHEN gcc_dsag_2016_short_naming THEN '' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '_S' )
      )

      (
        life_time       = gcc_class_life_time
        variable_kind   = cl_abap_typedescr=>kind_elem
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'GS_'
            WHEN gcc_dsag_2016_short_naming THEN '' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      (
        life_time       = gcc_class_life_time
        variable_kind   = cl_abap_typedescr=>kind_ref
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'GR_'
            WHEN gcc_dsag_2016_short_naming THEN '' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      (
        life_time       = gcc_class_life_time
        variable_kind   = cl_abap_typedescr=>kind_elem
        changeable_kind = gcc_constant_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'GCC_'
            WHEN gcc_dsag_2016_short_naming THEN '' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      (
        life_time       = gcc_class_life_time
        variable_kind   = cl_abap_typedescr=>kind_elem
        changeable_kind = gcc_static_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'GV_'
            WHEN gcc_dsag_2016_short_naming THEN '' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )


      "**********************************************************
      "Method - Types
      (
        life_time       = gcc_method_life_time
        variable_kind   = cl_abap_typedescr=>kind_table
        changeable_kind = gcc_type_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'LTT_'
            WHEN gcc_dsag_2016_short_naming THEN '_T' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '_T' )
      )

      (
        life_time       = gcc_method_life_time
        variable_kind   = cl_abap_typedescr=>kind_struct
        changeable_kind = gcc_type_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'LTS_'
            WHEN gcc_dsag_2016_short_naming THEN '_T' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '_S' )
      )

      (
        life_time       = gcc_method_life_time
        variable_kind   = cl_abap_typedescr=>kind_elem
        changeable_kind = gcc_type_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'LTV_'
            WHEN gcc_dsag_2016_short_naming THEN '_T' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      (
        life_time       = gcc_method_life_time
        variable_kind   = cl_abap_typedescr=>kind_ref
        changeable_kind = gcc_type_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'LTR_'
            WHEN gcc_dsag_2016_short_naming THEN '_T' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      "**********************************************************
      "Method - Variable
      (
        life_time       = gcc_method_life_time
        variable_kind   = cl_abap_typedescr=>kind_table
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'LT_'
            WHEN gcc_dsag_2016_short_naming THEN '_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '_T' )
      )

      (
        life_time       = gcc_method_life_time
        variable_kind   = cl_abap_typedescr=>kind_struct
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'LS_'
            WHEN gcc_dsag_2016_short_naming THEN '_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '_S' )
      )

      (
        life_time       = gcc_method_life_time
        variable_kind   = cl_abap_typedescr=>kind_elem
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'LV_'
            WHEN gcc_dsag_2016_short_naming THEN '_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      (
        life_time       = gcc_method_life_time
        variable_kind   = cl_abap_typedescr=>kind_ref
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'LR_'
            WHEN gcc_dsag_2016_short_naming THEN '_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      (
        life_time       = gcc_method_life_time
        variable_kind   = cl_abap_typedescr=>kind_elem
        changeable_kind = gcc_constant_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'LCC_'
            WHEN gcc_dsag_2016_short_naming THEN '_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      (
        life_time       = gcc_method_life_time
        variable_kind   = cl_abap_typedescr=>kind_elem
        changeable_kind = gcc_static_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'LV_'
            WHEN gcc_dsag_2016_short_naming THEN '_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      "**********************************************************
      "Importing - Variable
      (
        life_time     = gcc_importing_param_life_time
        variable_kind = cl_abap_typedescr=>kind_table
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'IT_'
            WHEN gcc_dsag_2016_short_naming THEN 'I_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '_T' )
      )

      (
        life_time     = gcc_importing_param_life_time
        variable_kind = cl_abap_typedescr=>kind_struct
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'IS_'
            WHEN gcc_dsag_2016_short_naming THEN 'I_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '_S' )
      )

      (
        life_time     = gcc_importing_param_life_time
        variable_kind = cl_abap_typedescr=>kind_elem
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'IV_'
            WHEN gcc_dsag_2016_short_naming THEN 'I_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      (
        life_time       = gcc_importing_param_life_time
        variable_kind   = cl_abap_typedescr=>kind_ref
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'IR_'
            WHEN gcc_dsag_2016_short_naming THEN 'I_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      "**********************************************************
      "Exporting - Variable
      (
        life_time     = gcc_exporting_param_life_time
        variable_kind = cl_abap_typedescr=>kind_table
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'ET_'
            WHEN gcc_dsag_2016_short_naming THEN 'E_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '_T' )
      )

      (
        life_time       = gcc_exporting_param_life_time
        variable_kind   = cl_abap_typedescr=>kind_struct
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'ES_'
            WHEN gcc_dsag_2016_short_naming THEN 'E_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '_S' )
      )

      (
        life_time       = gcc_exporting_param_life_time
        variable_kind   = cl_abap_typedescr=>kind_elem
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'EV_'
            WHEN gcc_dsag_2016_short_naming THEN 'E_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      (
        life_time        = gcc_exporting_param_life_time
        variable_kind    = cl_abap_typedescr=>kind_ref
        changeable_kind  = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'ER_'
            WHEN gcc_dsag_2016_short_naming THEN 'E_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      "**********************************************************
      "Changing - Variable
      (
        life_time       = gcc_changing_param_life_time
        variable_kind   = cl_abap_typedescr=>kind_table
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'CT_'
            WHEN gcc_dsag_2016_short_naming THEN 'C_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '_T' )
      )

      (
        life_time       = gcc_changing_param_life_time
        variable_kind   = cl_abap_typedescr=>kind_struct
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'CS_'
            WHEN gcc_dsag_2016_short_naming THEN 'C_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '_S' )
      )

      (
        life_time       = gcc_changing_param_life_time
        variable_kind   = cl_abap_typedescr=>kind_elem
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'CV_'
            WHEN gcc_dsag_2016_short_naming THEN 'C_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      (
        life_time       = gcc_changing_param_life_time
        variable_kind   = cl_abap_typedescr=>kind_ref
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'CR_'
            WHEN gcc_dsag_2016_short_naming THEN 'C_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      "**********************************************************
      "Returning - Variable
      (
        life_time       = gcc_returning_param_life_time
        variable_kind   = cl_abap_typedescr=>kind_table
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'RT_'
            WHEN gcc_dsag_2016_short_naming THEN 'R_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '_T' )
      )

      (
        life_time       = gcc_returning_param_life_time
        variable_kind   = cl_abap_typedescr=>kind_struct
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'RS_'
            WHEN gcc_dsag_2016_short_naming THEN 'R_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '_S' )
      )

      (
        life_time       = gcc_returning_param_life_time
        variable_kind   = cl_abap_typedescr=>kind_elem
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'RV_'
            WHEN gcc_dsag_2016_short_naming THEN 'R_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

      (
        life_time       = gcc_returning_param_life_time
        variable_kind   = cl_abap_typedescr=>kind_ref
        changeable_kind = gcc_variable_chng_kind
        prefix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN 'RR_'
            WHEN gcc_dsag_2016_short_naming THEN 'R_' )
        postfix =
          SWITCH #( lv_convention_name
            WHEN gcc_long_naming  THEN ''
            WHEN gcc_dsag_2016_short_naming THEN '' )
      )

    ).

  ENDMETHOD.

ENDCLASS.

CLASS zab_abap_variable_name_bo DEFINITION
  INHERITING FROM zab_abap_variable_bo.

  PUBLIC SECTION.

    TYPES:

      BEGIN OF gts_data,
        name            TYPE gtv_variable_name,
        life_time       TYPE gtv_life_time,
        variable_kind   TYPE gtv_variable_kind,
        changeable_kind TYPE gtv_changeable_kind,
      END OF gts_data.

    CLASS-METHODS create_by_data
      IMPORTING is_data                    TYPE gts_data
      RETURNING VALUE(rr_abap_variable_bo) TYPE REF TO zab_abap_variable_name_bo.

    METHODS get_variable_name
      IMPORTING iv_lower_case_ind       TYPE abap_bool DEFAULT abap_true
      RETURNING VALUE(rv_variable_name) TYPE gtv_variable_name
      RAISING   zab_return_exc.

  PROTECTED SECTION.

    DATA gs_data TYPE gts_data.

ENDCLASS.

CLASS zab_abap_variable_name_bo IMPLEMENTATION.


  METHOD create_by_data.

    rr_abap_variable_bo = NEW #( ).

    rr_abap_variable_bo->gs_data = is_data.

  ENDMETHOD.

  METHOD get_variable_name.

    DATA(ls_naming) =
      zab_abap_naming_bo=>get_instance( )->get_naming(
        life_time       = gs_data-life_time
        variable_kind   = gs_data-variable_kind
        changeable_kind = gs_data-changeable_kind ).

    rv_variable_name = ls_naming-prefix && gs_data-name && ls_naming-postfix.

    IF iv_lower_case_ind = abap_true.

      rv_variable_name = to_lower( rv_variable_name ).

    ENDIF.

  ENDMETHOD.

ENDCLASS.

CLASS zab_ddic_data_element_bo DEFINITION.

  PUBLIC SECTION.

    TYPES:
      BEGIN OF gts_field,
        name         TYPE string,
        data_element TYPE REF TO zab_ddic_data_element_bo,
      END OF gts_field,
      gtt_field_list TYPE STANDARD TABLE OF gts_field WITH EMPTY KEY.

    CLASS-METHODS:
      get_by_name
        IMPORTING iv_name                TYPE rollname
        RETURNING VALUE(rr_data_element) TYPE REF TO zab_ddic_data_element_bo
        RAISING   zab_return_exc,
      get_by_descr
        IMPORTING iv_name                TYPE string
                  ir_abap_elemdescr      TYPE REF TO cl_abap_elemdescr
        RETURNING VALUE(rr_data_element) TYPE REF TO zab_ddic_data_element_bo
        RAISING   zab_return_exc.

    METHODS:
      get_type_descr
        RETURNING VALUE(rr_type_descr) TYPE REF TO cl_abap_typedescr,
      get_struct_field_list
        RETURNING VALUE(rt_field_list) TYPE gtt_field_list
        RAISING   zab_return_exc,
      get_element_dd_field
        RETURNING VALUE(rs_dd_field) TYPE dfies
        RAISING   zab_return_exc,
      get_element_check_table
        RETURNING VALUE(rv_check_table) TYPE komp_check
        RAISING   zab_return_exc,
      get_dummy_value
        RETURNING VALUE(rv_text) TYPE string
        RAISING   zab_return_exc,
      get_sql_value
        IMPORTING iv_value       TYPE any
        RETURNING VALUE(rv_text) TYPE string
        RAISING   zab_return_exc,
      get_description
        RETURNING VALUE(rv_description) TYPE string.

  PROTECTED SECTION.
    DATA:
      gv_name       TYPE string,
      gr_type_descr TYPE REF TO cl_abap_typedescr.

ENDCLASS.


CLASS zab_ddic_data_element_bo IMPLEMENTATION.

  METHOD get_by_name.

    rr_data_element = NEW #( ).

    rr_data_element->gv_name = iv_name.

    CALL METHOD cl_abap_typedescr=>describe_by_name
      EXPORTING
        p_name         = iv_name
      RECEIVING
        p_descr_ref    = rr_data_element->gr_type_descr
      EXCEPTIONS
        type_not_found = 1
        OTHERS         = 2.

    IF sy-subrc <> 0.

      "Code error
      DATA(lr_return_exc) = zab_return_exc=>create_by_text(
        iv_message    = |Data type { iv_name } is not found.| ).

      RAISE EXCEPTION lr_return_exc.

    ENDIF.

  ENDMETHOD.

  METHOD get_by_descr.

    rr_data_element = NEW #( ).

    rr_data_element->gr_type_descr = ir_abap_elemdescr.

    DATA(lv_is_ddic_type_ind) = ir_abap_elemdescr->is_ddic_type( ).

    IF lv_is_ddic_type_ind = abap_false.

      DATA(lx_return) = zab_return_exc=>create_by_text(
        iv_message    = 'Element &1 is not a DDIC element.'
        iv_field_name = ''
        iv_variable_1 = CONV #( iv_name )
      ).

      RAISE EXCEPTION lx_return.

    ENDIF.

    DATA(ls_ddic_field) = ir_abap_elemdescr->get_ddic_field( ).

    rr_data_element->gv_name = ls_ddic_field-rollname.

  ENDMETHOD.

  METHOD get_type_descr.

    rr_type_descr = gr_type_descr.

  ENDMETHOD.

  METHOD get_struct_field_list.

    DATA(lr_structure_descr) =
      CAST cl_abap_structdescr( gr_type_descr ).

    DATA(lt_dd_field_list) =
      lr_structure_descr->get_ddic_field_list( ).

    LOOP AT lt_dd_field_list
      ASSIGNING FIELD-SYMBOL(<ls_dd_field>).

      APPEND INITIAL LINE TO rt_field_list
        ASSIGNING FIELD-SYMBOL(<ls_field>).

      <ls_field>-name = <ls_dd_field>-fieldname.

      <ls_field>-data_element =
        zab_ddic_data_element_bo=>get_by_name( <ls_dd_field>-rollname ).

    ENDLOOP.

  ENDMETHOD.

  METHOD get_element_dd_field.

    TRY.

        DATA(lr_element) = CAST cl_abap_elemdescr( gr_type_descr  ).

      CATCH cx_root INTO DATA(lx_root).

        "Code error
        DATA(lr_return_exc) = zab_return_exc=>create_by_text(
          iv_message    = |get_element_dd_field error:  { lx_root->get_text( ) }| ).

        RAISE EXCEPTION lr_return_exc.

    ENDTRY.

    rs_dd_field = lr_element->get_ddic_field( ).

  ENDMETHOD.

  METHOD get_element_check_table.

    DATA(ls_dd_field) = get_element_dd_field( ).

    "Get check table from structure
    IF ls_dd_field-checktable IS NOT INITIAL.

      rv_check_table = ls_dd_field-checktable.
      RETURN.

    ENDIF.

    DATA:
      ls_dd01v       TYPE dd01v,
      lt_dd07v_tab_a TYPE STANDARD TABLE OF dd07v,
      lt_dd07v_tab_n TYPE STANDARD TABLE OF dd07v.

    CALL FUNCTION 'DD_DOMA_GET'
      EXPORTING
        domain_name   = ls_dd_field-domname
*       GET_STATE     = 'M  '
*       LANGU         = SY-LANGU
*       PRID          = 0
*       WITHTEXT      = 'X'
      IMPORTING
        dd01v_wa_a    = ls_dd01v
*       DD01V_WA_N    =
*       GOT_STATE     =
      TABLES
        dd07v_tab_a   = lt_dd07v_tab_a
        dd07v_tab_n   = lt_dd07v_tab_n
      EXCEPTIONS
        illegal_value = 1
        op_failure    = 2
        OTHERS        = 3.

    IF sy-subrc <> 0.

      DATA(lr_return_exc) = zab_return_exc=>create_by_system_message( ).

      RAISE EXCEPTION lr_return_exc.

    ENDIF.

    IF ls_dd01v-entitytab IS NOT INITIAL.

      rv_check_table = ls_dd01v-entitytab.
      RETURN.

    ENDIF.

    IF lt_dd07v_tab_a[] IS NOT INITIAL.

      DATA(lv_count) = lines( lt_dd07v_tab_a ).

      DATA(lv_count_text) = |{ lv_count }|.

      rv_check_table = lv_count_text && | fixed values|.

    ENDIF.

  ENDMETHOD.

  METHOD get_dummy_value.

    DATA(ls_dd_field) = get_element_dd_field( ).

    CASE ls_dd_field-inttype.

      WHEN 'C' OR 'g'.
        "C Character String
        "g  Character string with variable length (ABAP type STRING)

        rv_text = ''''''.

      WHEN 'D'.
        "D Date (Date: YYYYMMDD)

        rv_text = '00000000'.

      WHEN 'T'.
        "T  Time (Time: HHMMSS)

        rv_text = '000000'.

      WHEN 'N'.
        "N Character String with Digits Only
        rv_text = '0'.

      WHEN 'N'.
        "I Integer number (4-byte integer with sign)
        rv_text = '0'.

      WHEN 'P'.
        "P Packed number
        rv_text = '''0.0'''.

      WHEN 'I' OR'b' OR 's' OR 'F' OR 'X' OR
        'a' OR 'e'.
        "I
        "b  1-byte integer, integer number <= 254
        "s  2-byte integer, only for length field before LCHR or LRAW
        "F  Floating point number to accuracy of 8 bytes
        "X  Byte Seq. (heXadecimal), in DDIC metadata also for INT1/2/4

        "a  Decimal Floating Point Number, 16 Digits
        "e  Decimal Floating Point Number, 34 Digits

        rv_text = '0'.

      WHEN OTHERS.
        "y  Byte sequence with variable length (ABAP type XSTRING)
        "u  Structured type, flat
        "v  Structured type, deep
        "h  Table type
        "  Character string (old Dictionary type VARC)
        "r  Reference to class/interface
        "l  Reference to data object

        "j  Static Boxed Components
        "k  Generic Boxed Components

        rv_text = |? initial value unknown for datatype: | && ls_dd_field-inttype.

    ENDCASE.

  ENDMETHOD.

  METHOD get_sql_value.

    DATA(ls_dd_field) = get_element_dd_field( ).

    CASE ls_dd_field-inttype.

      WHEN 'C'.
        "C Character String

        rv_text = |'| && iv_value && |'|.

      WHEN 'D'.
        "D Date (Date: YYYYMMDD)

        rv_text = |'| && iv_value && |'|.

      WHEN 'T'.
        "T  Time (Time: HHMMSS)

        rv_text = |'| && iv_value && |'|.

      WHEN 'N'.
        "N Character String with Digits Only
        rv_text = |'| && iv_value && |'|.

      WHEN 'N'.
        "I Integer number (4-byte integer with sign)
        rv_text = iv_value.

      WHEN 'P'.
        "P Packed number
        rv_text = iv_value.

      WHEN 'I' OR'b' OR 's' OR 'F'.
        "I
        "b  1-byte integer, integer number <= 254
        "s  2-byte integer, only for length field before LCHR or LRAW
        "F  Floating point number to accuracy of 8 bytes
        rv_text = iv_value.

      WHEN OTHERS.

        "X  Byte Seq. (heXadecimal), in DDIC metadata also for INT1/2/4
        "g  Character string with variable length (ABAP type STRING)
        "y  Byte sequence with variable length (ABAP type XSTRING)
        "u  Structured type, flat
        "v  Structured type, deep
        "h  Table type
        "  Character string (old Dictionary type VARC)
        "r  Reference to class/interface
        "l  Reference to data object
        "a  Decimal Floating Point Number, 16 Digits
        "e  Decimal Floating Point Number, 34 Digits
        "j  Static Boxed Components
        "k  Generic Boxed Components

        rv_text = |? syntax unknown for datatype: | && ls_dd_field-inttype.

    ENDCASE.

  ENDMETHOD.

  METHOD get_description.



  ENDMETHOD.

ENDCLASS.

CLASS zab_deep_to_flat_data_convert DEFINITION.

  PUBLIC SECTION.


    TYPES:
      gtv_level TYPE i,
      gtv_key   TYPE int4,

      BEGIN OF gts_data_component,
        level                    TYPE gtv_level,
        key                      TYPE gtv_key,
        parent_key               TYPE gtv_key,

        kind                     TYPE abap_typecategory,
        name                     TYPE string,

        internal_value           TYPE string,
        external_value           TYPE string,

        rollname                 TYPE rollname,
        domname                  TYPE domname,

*        checktable               TYPE tabname,         "Based on the structure
        domain_value_table       TYPE dd01v-entitytab, "Based on the domain
        domain_fixed_value_count TYPE int4,

        leng                     TYPE ddleng,
*        intlen                   TYPE intlen,
        outputlen                TYPE outputlen,
        decimals                 TYPE decimals,

        datatype                 TYPE dynptype,
        inttype                  TYPE inttype,

        fieldtext                TYPE as4text,
        reptext                  TYPE reptext,
        scrtext_s                TYPE scrtext_s,
        scrtext_m                TYPE scrtext_m,
        scrtext_l                TYPE scrtext_l,

        convexit                 TYPE convexit,
        keyflag                  TYPE keyflag,
        lowercase                TYPE lowercase,

      END OF gts_data_component,
      gtt_data_components TYPE STANDARD TABLE OF gts_data_component WITH DEFAULT KEY.


    METHODS convert_data
      IMPORTING iv_root_name              TYPE string
                is_data                   TYPE any
      RETURNING VALUE(rt_data_components) TYPE gtt_data_components.

  PROTECTED SECTION.

    METHODS add_field_data
      IMPORTING level              TYPE gtv_level
                key                TYPE gtv_key
                parent_key         TYPE gtv_key
                kind               TYPE abap_typecategory
                field_descr        TYPE REF TO cl_abap_datadescr
                field_name         TYPE string
                field_value        TYPE any
      CHANGING  ct_data_components TYPE gtt_data_components.

    METHODS write_table_data
      IMPORTING iv_level           TYPE gtv_level
                iv_parent_key      TYPE gtv_key
                iv_name            TYPE string
                ir_type            TYPE REF TO cl_abap_datadescr
                it_data            TYPE ANY TABLE
      CHANGING  cv_key             TYPE gtv_key
                ct_data_components TYPE gtt_data_components.

    METHODS write_structure_data
      IMPORTING iv_level           TYPE gtv_level
                iv_parent_key      TYPE gtv_key
                iv_name            TYPE string
                ir_type            TYPE REF TO cl_abap_datadescr
                is_data            TYPE any
      CHANGING  cv_key             TYPE gtv_key
                ct_data_components TYPE gtt_data_components.

    METHODS write_any_data
      IMPORTING iv_level           TYPE gtv_level
                iv_parent_key      TYPE gtv_key
                iv_name            TYPE string
                ir_type            TYPE REF TO cl_abap_datadescr
                i_data             TYPE any
      CHANGING  cv_key             TYPE gtv_key
                ct_data_components TYPE gtt_data_components.

ENDCLASS.

CLASS zab_deep_to_flat_data_convert IMPLEMENTATION.

  METHOD convert_data.

    DATA lr_data TYPE REF TO data.

    DATA lr_root TYPE REF TO cl_abap_datadescr.

    lr_root = CAST cl_abap_datadescr( cl_abap_typedescr=>describe_by_data( is_data ) ).

    DATA lv_key TYPE gtv_key.

    lv_key = 1.

    write_any_data(
      EXPORTING
        iv_level           = 1
        iv_parent_key      = 0
        iv_name            = 'Root'
        ir_type            = lr_root
        i_data             = is_data
      CHANGING
        cv_key             = lv_key
        ct_data_components = rt_data_components ).

  ENDMETHOD.

  METHOD write_any_data.

    CASE ir_type->kind.

      WHEN cl_abap_typedescr=>kind_elem.

        "Add component
        add_field_data(
          EXPORTING level              = iv_level
                    key                = cv_key
                    parent_key         = iv_parent_key
                    kind         = cl_abap_typedescr=>kind_elem
                    field_descr        = ir_type
                    field_name         = iv_name
                    field_value        = i_data
          CHANGING  ct_data_components = ct_data_components ).

      WHEN cl_abap_typedescr=>kind_struct.

        write_structure_data(
          EXPORTING
            iv_level      = iv_level
            iv_parent_key = iv_parent_key
            iv_name       = iv_name
            ir_type       = ir_type
            is_data       = i_data
        CHANGING
          cv_key             = cv_key
          ct_data_components = ct_data_components ).

      WHEN cl_abap_typedescr=>kind_table.

        write_table_data(
          EXPORTING
            iv_parent_key      = iv_parent_key
            iv_level           = iv_level
            iv_name            = iv_name
            ir_type            = ir_type
            it_data            = i_data
          CHANGING
            cv_key             = cv_key
            ct_data_components = ct_data_components ).

    ENDCASE.

  ENDMETHOD.

  METHOD write_structure_data.

    "Add component
    add_field_data(
      EXPORTING level              = iv_level
                key                = cv_key
                parent_key         = iv_parent_key
                kind         = cl_abap_typedescr=>kind_struct
                field_descr        = ir_type
                field_name         = iv_name
                field_value        = ''
      CHANGING  ct_data_components = ct_data_components ).

    DATA(lr_struct) = CAST cl_abap_structdescr( ir_type ).

    DATA(lt_components) = lr_struct->get_components( ).

    DATA lv_level TYPE i.

    lv_level = iv_level + 1.

    DATA(lv_parent_key) = cv_key.

    LOOP AT lt_components
      ASSIGNING FIELD-SYMBOL(<ls_component>).

      cv_key = cv_key + 1.

      DATA(lv_field_name) =
        zab_abap_text_bo=>add_trailing_space(
          iv_text = <ls_component>-name
          iv_length = 30 ).

      ASSIGN COMPONENT <ls_component>-name
        OF STRUCTURE is_data
        TO FIELD-SYMBOL(<l_sub_field_data>).

      write_any_data(
        EXPORTING
          iv_level           = lv_level
          iv_parent_key      = lv_parent_key
          iv_name            = <ls_component>-name
          ir_type            = <ls_component>-type
          i_data             = <l_sub_field_data>
        CHANGING
          cv_key             = cv_key
          ct_data_components = ct_data_components ).

    ENDLOOP.

  ENDMETHOD.

  METHOD write_table_data.

    "Add component
    FIELD-SYMBOLS <lt_table> TYPE ANY TABLE.

    ASSIGN it_data TO <lt_table>.

    add_field_data(
      EXPORTING level              = iv_level
                key                = cv_key
                parent_key         = iv_parent_key
                kind         = cl_abap_typedescr=>kind_struct
                field_descr        = ir_type
                field_name         = |{ iv_name } [{ lines( <lt_table> ) }]|
                field_value        = ''
      CHANGING  ct_data_components = ct_data_components ).

    "Level
    DATA lv_level TYPE i.

    lv_level = iv_level + 1.

    "Get line type
    DATA(lr_table_type) = CAST cl_abap_tabledescr( ir_type ).

    DATA(lr_line_type) = lr_table_type->get_table_line_type( ).

    "Parent key
    DATA(lv_parent_key) = cv_key.

    "Loop at records
    LOOP AT it_data
      ASSIGNING FIELD-SYMBOL(<ls_data>).

      DATA(lv_tabix) = sy-tabix.

      cv_key = cv_key + 1.

      write_any_data(
        EXPORTING
          iv_level           = lv_level
          iv_parent_key      = lv_parent_key
          iv_name            = '[' && sy-tabix && ']'
          ir_type            = lr_line_type
          i_data             = <ls_data>
        CHANGING
          cv_key             = cv_key
          ct_data_components = ct_data_components ).

    ENDLOOP.

  ENDMETHOD.

  METHOD add_field_data.

    APPEND INITIAL LINE TO ct_data_components
      ASSIGNING FIELD-SYMBOL(<ls_data_component>).

    <ls_data_component>-level          = level.
    <ls_data_component>-key            = key.
    <ls_data_component>-parent_key     = parent_key.
    <ls_data_component>-kind     = kind.
    <ls_data_component>-name     = field_name.

    "Set value
    <ls_data_component>-internal_value    = field_value.

    DATA lv_char TYPE c LENGTH 900.
    WRITE field_value TO lv_char LEFT-JUSTIFIED.
    <ls_data_component>-external_value = lv_char.

    "Set meta data
    DATA(lv_is_ddic_type_ind) = field_descr->is_ddic_type( ).

    CASE field_descr->kind.

      WHEN cl_abap_typedescr=>kind_elem.

        DATA(lr_elem_descr) = CAST cl_abap_elemdescr( field_descr ).

        CASE lv_is_ddic_type_ind.

          WHEN abap_true.

            DATA(ls_ddic) = lr_elem_descr->get_ddic_field( ).

            <ls_data_component>-rollname      = ls_ddic-rollname.
            <ls_data_component>-domname       = ls_ddic-domname.
*            <ls_data_component>-checktable    = ls_ddic-checktable.

            <ls_data_component>-leng          = ls_ddic-leng.
            <ls_data_component>-decimals      = ls_ddic-decimals.
*            <ls_data_component>-intlen        = ls_ddic-intlen.
            <ls_data_component>-outputlen     = ls_ddic-outputlen.

            <ls_data_component>-datatype      = ls_ddic-datatype.
            <ls_data_component>-inttype       = ls_ddic-inttype.

            <ls_data_component>-convexit      = ls_ddic-convexit.
            <ls_data_component>-keyflag       = ls_ddic-keyflag.
            <ls_data_component>-lowercase     = ls_ddic-lowercase.

            IF ls_ddic-domname IS NOT INITIAL.

              "Fixed values
              DATA lt_dd07v TYPE STANDARD TABLE OF dd07v.

              CALL FUNCTION 'DD_DOMVALUES_GET'
                EXPORTING
                  domname        = ls_ddic-domname
                  text           = ''
                  langu          = ''
                TABLES
                  dd07v_tab      = lt_dd07v
                EXCEPTIONS
                  wrong_textflag = 1
                  OTHERS         = 2.

              IF sy-subrc = 0.

              ENDIF.

              <ls_data_component>-domain_fixed_value_count = lines( lt_dd07v ).

              REFRESH lt_dd07v.

              DATA ls_dd01v TYPE dd01v.

              CALL FUNCTION 'DDIF_DOMA_GET'
                EXPORTING
                  name      = ls_ddic-domname
*                 STATE     = 'A'
*                 LANGU     = ' '
                IMPORTING
*                 GOTSTATE  =
                  dd01v_wa  = ls_dd01v
                TABLES
                  dd07v_tab = lt_dd07v
*               EXCEPTIONS
*                 ILLEGAL_INPUT       = 1
*                 OTHERS    = 2
                .
              IF sy-subrc <> 0.
* Implement suitable error handling here
              ENDIF.

              <ls_data_component>-domain_value_table = ls_dd01v-entitytab.

              REFRESH lt_dd07v.



            ENDIF.

          WHEN OTHERS.

*            <ls_data_component>-output_length = ls_ddic-outputlen.

        ENDCASE.

      WHEN cl_abap_typedescr=>kind_struct.

        DATA(lr_struct_descr) = CAST cl_abap_structdescr( field_descr ).

        CASE lv_is_ddic_type_ind.

          WHEN abap_true.

            DATA(lv_relative_name) =  lr_struct_descr->get_relative_name( ).

            DATA(lv_tabname) = CONV ddobjname( lv_relative_name ).

            CALL FUNCTION 'DDIF_NAMETAB_GET'
              EXPORTING
                tabname   = lv_tabname
                all_types = 'X'
*               LFIELDNAME        = ' '
*               GROUP_NAMES       = ' '
*               UCLEN     =
              IMPORTING
*               X030L_WA  = p_header
*               DTELINFO_WA       =
*               TTYPINFO_WA       =
*               DDOBJTYPE =
                dfies_wa  = ls_ddic
*               LINES_DESCR       =
*             TABLES
*               X031L_TAB =
*               DFIES_TAB =
              EXCEPTIONS
                not_found = 1
                OTHERS    = 2.

        ENDCASE.

      WHEN cl_abap_typedescr=>kind_table.

        DATA(lr_table_descr) = CAST cl_abap_tabledescr( field_descr ).

        CASE lv_is_ddic_type_ind.

          WHEN abap_true.

            lv_relative_name =  lr_table_descr->get_relative_name( ).

            lv_tabname = CONV ddobjname( lv_relative_name ).

            CALL FUNCTION 'DDIF_NAMETAB_GET'
              EXPORTING
                tabname   = lv_tabname
                all_types = 'X'
*               LFIELDNAME        = ' '
*               GROUP_NAMES       = ' '
*               UCLEN     =
              IMPORTING
*               X030L_WA  = p_header
*               DTELINFO_WA       =
*               TTYPINFO_WA       =
*               DDOBJTYPE =
                dfies_wa  = ls_ddic
*               LINES_DESCR       =
*             TABLES
*               X031L_TAB =
*               DFIES_TAB =
              EXCEPTIONS
                not_found = 1
                OTHERS    = 2.

        ENDCASE.

    ENDCASE.

    <ls_data_component>-fieldtext     = ls_ddic-fieldtext.
    <ls_data_component>-reptext       = ls_ddic-reptext.
    <ls_data_component>-scrtext_s     = ls_ddic-scrtext_s.
    <ls_data_component>-scrtext_m     = ls_ddic-scrtext_m.
    <ls_data_component>-scrtext_l     = ls_ddic-scrtext_l.

    CLEAR ls_ddic.

  ENDMETHOD.

ENDCLASS.

CLASS zab_abap_struct_descr DEFINITION.

  PUBLIC SECTION.

    TYPES:
      gts_component TYPE LINE OF cl_abap_structdescr=>component_table,
      gtt_component TYPE cl_abap_structdescr=>component_table.

    CLASS-METHODS create_by_struct_descr
      IMPORTING ir_struct_descriptor   TYPE REF TO cl_abap_structdescr
      RETURNING VALUE(rr_struct_descr) TYPE REF TO zab_abap_struct_descr.

    CLASS-METHODS create_by_name
      IMPORTING iv_name                TYPE string
      RETURNING VALUE(rr_struct_descr) TYPE REF TO zab_abap_struct_descr.

    METHODS get_all_element_type_descr
      RETURNING VALUE(rt_components) TYPE gtt_component
      RAISING   zab_return_exc.

    METHODS get_all_element_ddic
      RETURNING VALUE(rt_ddic_fields) TYPE ddfields
      RAISING   zab_return_exc.

    METHODS get_all_element_field_cat
      RETURNING VALUE(rt_field_catalog) TYPE lvc_t_fcat
      RAISING   zab_return_exc.

  PROTECTED SECTION.

    DATA:
      gv_name           TYPE string,
      gr_struct_descr   TYPE REF TO cl_abap_structdescr,
      gt_all_components TYPE gtt_component.

    METHODS add_component
      IMPORTING is_component TYPE gts_component
      RAISING   zab_return_exc.

ENDCLASS.

CLASS zab_abap_struct_descr IMPLEMENTATION.

  METHOD create_by_struct_descr.

    rr_struct_descr = NEW #( ).

    rr_struct_descr->gv_name = ''.

    rr_struct_descr->gr_struct_descr = ir_struct_descriptor.

  ENDMETHOD.

  METHOD create_by_name.

    rr_struct_descr = NEW #( ).

    rr_struct_descr->gv_name = iv_name.

    rr_struct_descr->gr_struct_descr = CAST cl_abap_structdescr( cl_abap_typedescr=>describe_by_name( iv_name ) ).

  ENDMETHOD.

  METHOD get_all_element_type_descr.

    REFRESH gt_all_components.

    DATA(lt_components) = gr_struct_descr->get_components( ).

    LOOP AT lt_components
      ASSIGNING FIELD-SYMBOL(<ls_component>).

      add_component( <ls_component> ).

    ENDLOOP.

    rt_components = me->gt_all_components.

  ENDMETHOD.

  METHOD get_all_element_ddic.

    DATA(lt_components) = get_all_element_type_descr( ).

    LOOP AT lt_components
      ASSIGNING FIELD-SYMBOL(<ls_component>).

      APPEND INITIAL LINE TO rt_ddic_fields
        ASSIGNING FIELD-SYMBOL(<ls_ddic_field>).

      IF <ls_component>-type->kind <> cl_abap_typedescr=>kind_elem.

        DATA(lr_return_exc) =
          zab_return_exc=>create_by_text(
            'The all element list should only contain data elements. Structure name: ' && me->gv_name && '.' ).

        RAISE EXCEPTION lr_return_exc.

      ENDIF.

      DATA(lr_elem_descr) = CAST cl_abap_elemdescr( <ls_component>-type ).

      DATA(lv_ddic_ind) = lr_elem_descr->is_ddic_type( ).

      IF lv_ddic_ind = abap_true.

        DATA(ls_ddic) = lr_elem_descr->get_ddic_field( ).

        MOVE-CORRESPONDING ls_ddic
          TO <ls_ddic_field>.

        <ls_ddic_field>-fieldname = <ls_component>-name.

      ELSE.

        <ls_ddic_field>-tabname = ''.
        <ls_ddic_field>-fieldname = <ls_component>-name.

        <ls_ddic_field>-domname  = ''.
        <ls_ddic_field>-rollname = ''.

*          <ls_ddic_field>-OUTPUTLEN
*          <ls_ddic_field>-DECIMALS

        <ls_ddic_field>-scrtext_s = <ls_component>-name.
        <ls_ddic_field>-scrtext_m = <ls_component>-name.
        <ls_ddic_field>-scrtext_l = <ls_component>-name.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD get_all_element_field_cat.

    DATA(lt_all_element_ddic) = me->get_all_element_ddic( ).

    LOOP AT lt_all_element_ddic
      ASSIGNING FIELD-SYMBOL(<ls_element_ddic>).

      APPEND INITIAL LINE TO rt_field_catalog
        ASSIGNING FIELD-SYMBOL(<ls_catalog_field>).

      MOVE-CORRESPONDING <ls_element_ddic>
        TO <ls_catalog_field>.

    ENDLOOP.

  ENDMETHOD.

  METHOD add_component.

    CASE is_component-type->kind.

      WHEN cl_abap_typedescr=>kind_elem.

        APPEND is_component TO me->gt_all_components.

      WHEN cl_abap_typedescr=>kind_struct.

*                APPEND is_component TO me->gt_all_components.

        DATA(lr_struct_descr) = CAST cl_abap_structdescr( is_component-type ).

        DATA(lt_components) = lr_struct_descr->get_components( ).

        LOOP AT lt_components
          ASSIGNING FIELD-SYMBOL(<ls_component>).

          add_component( <ls_component> ).

        ENDLOOP.

      WHEN cl_abap_typedescr=>kind_table.

        APPEND is_component TO me->gt_all_components.

*         DATA(lr_table_descr) = CAST CL_ABAP_TABLEDESCR( is_component-type ).

      WHEN OTHERS.

        "Code error
        DATA(lr_return_exc) = zab_return_exc=>create_by_text(
          iv_message    = |Data kind { is_component-type->kind } is not supported.| ).

        RAISE EXCEPTION lr_return_exc.

    ENDCASE.

  ENDMETHOD.

ENDCLASS.

CLASS zab_ddic_component_type DEFINITION
  INHERITING FROM zab_ddic_data_element_bo.

  PUBLIC SECTION.

    TYPES:
      gtv_name TYPE string.

    CLASS-METHODS create_component_by_name
      IMPORTING iv_name                       TYPE gtv_name
      RETURNING VALUE(rr_ddic_component_type) TYPE REF TO zab_ddic_component_type
      RAISING   zab_return_exc.

    METHODS get_kind
      RETURNING VALUE(rv_kind) TYPE abap_typecategory.

  PROTECTED SECTION.

ENDCLASS.

CLASS zab_ddic_component_type IMPLEMENTATION.

  METHOD create_component_by_name.

    DATA lv_structure_name TYPE string.

    rr_ddic_component_type = NEW #( ).

    SPLIT iv_name
      AT '-'
      INTO TABLE DATA(lt_names)
      IN CHARACTER MODE.

    IF lines( lt_names ) = 1.

      rr_ddic_component_type->gv_name = iv_name.

      rr_ddic_component_type->gr_type_descr = cl_abap_typedescr=>describe_by_name( iv_name ).

    ELSE.

      DATA(lv_count) = 0.

      DATA lt_components TYPE cl_abap_structdescr=>component_table.

      LOOP AT lt_names
        ASSIGNING FIELD-SYMBOL(<lv_name>).

        lv_count = lv_count + 1.

        IF lv_count = 1.

          DATA(lr_type_descr) = cl_abap_typedescr=>describe_by_name( <lv_name> ).

        ELSE.

          READ TABLE lt_components
            WITH KEY name = <lv_name>
            ASSIGNING FIELD-SYMBOL(<ls_component>).

          IF sy-subrc <> 0.

            DATA(lx_return) = zab_return_exc=>create_by_text(
              iv_message    = 'Sub field &1 not found in structure &2. Probably a LIKE parameter.'
              iv_field_name = ''
              iv_variable_1 = CONV #( <lv_name> )
              iv_variable_2 = CONV #( lv_structure_name )
            ).

            RAISE EXCEPTION lx_return.

          ENDIF.

          DATA(lv_name) = <lv_name>.
          lr_type_descr = <ls_component>-type.

        ENDIF.

        CASE lr_type_descr->kind.

          WHEN cl_abap_typedescr=>kind_struct.

            IF lv_count = 1.

              DATA(lr_struct_descr) = zab_abap_struct_descr=>create_by_name( <lv_name> ).

              lv_structure_name = <lv_name>.
              lt_components = lr_struct_descr->get_all_element_type_descr( ).

            ENDIF.

          WHEN cl_abap_typedescr=>kind_elem.

            EXIT.

          WHEN OTHERS.

            "Code error
            DATA(lr_return_exc) = zab_return_exc=>create_by_text(
              iv_message    = |Data kind type { lr_type_descr->kind } is not supported.| ).

            RAISE EXCEPTION lr_return_exc.

        ENDCASE.

      ENDLOOP.

      IF lr_type_descr IS INITIAL.

        "Code error
        lr_return_exc = zab_return_exc=>create_by_text(
          iv_message    = |Technical error: lr_type_descr is empty.| ).

        RAISE EXCEPTION lr_return_exc.

      ENDIF.

      IF lr_type_descr->kind <> cl_abap_typedescr=>kind_elem.

        "Code error
        lr_return_exc = zab_return_exc=>create_by_text(
          iv_message    = |Technical error: the data kinds are not the same.| ).

        RAISE EXCEPTION lr_return_exc.

      ENDIF.

      DATA(lr_data_elem_descr) = CAST cl_abap_elemdescr( lr_type_descr ).

      DATA(ls_ddic) = lr_data_elem_descr->get_ddic_field( ).

      rr_ddic_component_type->gv_name = ls_ddic-rollname.

      rr_ddic_component_type->gr_type_descr = lr_data_elem_descr.

    ENDIF.

  ENDMETHOD.

  METHOD get_kind.

    DATA(lr_type_descr) = cl_abap_typedescr=>describe_by_name( gv_name ).

    rv_kind = lr_type_descr->kind.

  ENDMETHOD.

ENDCLASS.

CLASS zab_ddic_db_table_bo DEFINITION
  CREATE PROTECTED.

  PUBLIC SECTION.

    TYPES:
      gts_key_field      TYPE dfies,
      gtt_key_field_list TYPE ddfields.

    CLASS-METHODS:
      get_by_name
        IMPORTING iv_name                    TYPE tabname16
        RETURNING VALUE(rr_db_table_bo_util) TYPE REF TO zab_ddic_db_table_bo
        RAISING   zab_return_exc.

    METHODS get_key_field_list
      IMPORTING iv_client_ind            TYPE abap_bool DEFAULT abap_false
      RETURNING VALUE(rt_key_field_list) TYPE gtt_key_field_list.

    METHODS get_last_record
      RETURNING VALUE(rr_data) TYPE REF TO data
      RAISING   zab_return_exc.

    TYPES:
      BEGIN OF gt_last_record_field,
        field_name TYPE fieldname,
        value      TYPE string,
      END OF gt_last_record_field,
      gt_last_record_fields TYPE STANDARD TABLE OF gt_last_record_field WITH DEFAULT KEY.

    METHODS get_last_record_field_values
      RETURNING VALUE(rt_last_record_fields) TYPE gt_last_record_fields
      RAISING   zab_return_exc.

  PROTECTED SECTION.

    DATA:
      gv_name       TYPE tabname16,
      gr_descriptor TYPE REF TO cl_abap_structdescr.

ENDCLASS.

CLASS zab_ddic_db_table_bo IMPLEMENTATION.

  METHOD get_by_name.

    SELECT SINGLE tabname
      FROM dd02l
      WHERE
        tabname  = @iv_name AND
        tabclass = 'TRANSP'
      INTO @DATA(ls_dd02l).

    IF sy-subrc <> 0.

      DATA(lx_return) = zab_return_exc=>create_by_text(
        iv_message    = '&1 is not a database table'
        iv_field_name = ''
        iv_variable_1 = CONV #( iv_name ) ).

      RAISE EXCEPTION lx_return.

    ENDIF.

    rr_db_table_bo_util = NEW #( ).

    rr_db_table_bo_util->gv_name = iv_name.

    rr_db_table_bo_util->gr_descriptor = CAST cl_abap_structdescr( cl_abap_typedescr=>describe_by_name( iv_name ) ).

  ENDMETHOD.

  METHOD get_key_field_list.

    DATA lr_descr TYPE REF TO cl_abap_structdescr.

    lr_descr  = me->gr_descriptor.

    DATA(lt_field_list) = lr_descr->get_ddic_field_list( ).

    LOOP AT lt_field_list
      ASSIGNING FIELD-SYMBOL(<ls_field>)
      WHERE keyflag = abap_true.

      "Skip client field.
      IF iv_client_ind = abap_false.

        IF <ls_field>-domname = 'MANDT'.

          CONTINUE.

        ENDIF.

      ENDIF.

      APPEND <ls_field>
        TO rt_key_field_list.

    ENDLOOP.

  ENDMETHOD.

  METHOD get_last_record.

    DATA(lt_key_fields) = me->get_key_field_list( ).

    "Select fields
    DATA lt_select_field_list TYPE TABLE OF string.

    LOOP AT lt_key_fields
      ASSIGNING FIELD-SYMBOL(<ls_key_field>).

      APPEND INITIAL LINE TO lt_select_field_list
        ASSIGNING FIELD-SYMBOL(<lv_select_field>).

      <lv_select_field> = <ls_key_field>-fieldname.

      IF sy-tabix > 1.

        <lv_select_field> = |, | && <lv_select_field>.

      ENDIF.

    ENDLOOP.

    "Order by
    DATA lv_order_by_text  TYPE string.

    LOOP AT lt_key_fields
      ASSIGNING <ls_key_field>.

      IF lv_order_by_text IS NOT INITIAL.
        lv_order_by_text = lv_order_by_text && |, |.
      ENDIF.

      lv_order_by_text = lv_order_by_text && <ls_key_field>-fieldname && | DESCENDING|.

    ENDLOOP.

    "Table declaration
    "- Create structure and table
    DATA(lr_struct_descr) = zab_abap_struct_descr=>create_by_struct_descr( me->gr_descriptor ).
    DATA(lt_components) = lr_struct_descr->get_all_element_type_descr( ).

    DATA lt_new_table_components LIKE lt_components.

    LOOP AT lt_key_fields
      ASSIGNING <ls_key_field>.

      READ TABLE lt_components
        WITH KEY name = <ls_key_field>-fieldname
        ASSIGNING FIELD-SYMBOL(<ls_component>).

      IF sy-subrc <> 0.

        "Code error
        DATA(lr_return_exc) = zab_return_exc=>create_by_text(
          iv_message    = |Field name { <ls_key_field>-fieldname } not found.| ).

        RAISE EXCEPTION lr_return_exc.

      ENDIF.

      APPEND <ls_component>
        TO lt_new_table_components.

    ENDLOOP.

    DATA(lr_new_struct_descr) = cl_abap_structdescr=>create( lt_new_table_components ).

    CREATE DATA rr_data
       TYPE HANDLE lr_new_struct_descr.

    DATA(lr_new_table_descr) = cl_abap_tabledescr=>create( lr_new_struct_descr ).

    DATA lr_table_data TYPE REF TO data.

    CREATE DATA lr_table_data
       TYPE HANDLE lr_new_table_descr.

    FIELD-SYMBOLS <lt_new_table> TYPE STANDARD TABLE.

    ASSIGN lr_table_data->* TO <lt_new_table>.

    "Select data
    SELECT

        (lt_select_field_list)

      FROM (me->gv_name)

      ORDER BY (lv_order_by_text)

      INTO TABLE @<lt_new_table>

      UP TO 1 ROWS.

    IF sy-subrc <> 0.

      RETURN.

    ENDIF.

    "Select row
    FIELD-SYMBOLS <ls_new_record> TYPE any.

    ASSIGN rr_data->* TO <ls_new_record>.

    READ TABLE <lt_new_table>
      INTO <ls_new_record>
      INDEX 1.

  ENDMETHOD.

  METHOD get_last_record_field_values.

    DATA(lr_data) = get_last_record( ).

    DATA(lt_key_fields) = me->get_key_field_list( ).

    ASSIGN lr_data->*
      TO FIELD-SYMBOL(<ls_record>).

    LOOP AT lt_key_fields
      ASSIGNING FIELD-SYMBOL(<ls_key_field>).

      ASSIGN COMPONENT <ls_key_field>-fieldname
        OF STRUCTURE <ls_record>
        TO FIELD-SYMBOL(<lv_value>).

      APPEND INITIAL LINE TO rt_last_record_fields
        ASSIGNING FIELD-SYMBOL(<ls_last_record_field>).

      <ls_last_record_field>-field_name = <ls_key_field>-fieldname.
      <ls_last_record_field>-value      = <lv_value>.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS zab_abap_function_module_bo DEFINITION.

  PUBLIC SECTION.

    TYPES:
      gtv_parameter_type TYPE rs38l_kind,
      gts_parameter_data TYPE fupararef.

    TYPES:
      gtt_parameters_data TYPE STANDARD TABLE OF gts_parameter_data WITH EMPTY KEY,

      BEGIN OF gts_data,
        header     TYPE tfdir,
        parameters TYPE gtt_parameters_data,
      END OF gts_data,

      BEGIN OF gts_parameter,
        name              TYPE fupararef-parameter,
        type              TYPE fupararef-paramtype,
        data_element_name TYPE string,
        data_element      TYPE REF TO zab_ddic_data_element_bo,
      END OF gts_parameter,
      gtt_parameter_list TYPE STANDARD TABLE OF gts_parameter WITH EMPTY KEY.

    CONSTANTS:
      gcc_importing_param_type TYPE gtv_parameter_type VALUE 'I',
      gcc_exporting_param_type TYPE gtv_parameter_type VALUE 'E',
      gcc_changing_param_type  TYPE gtv_parameter_type VALUE 'C',
      gcc_tables_param_type    TYPE gtv_parameter_type VALUE 'T'.

    CLASS-METHODS:
      get_instance_by_name
        IMPORTING iv_name            TYPE rs38l_fnam
        RETURNING VALUE(rr_instance) TYPE REF TO zab_abap_function_module_bo.

    METHODS:
      get_data
        RETURNING VALUE(rs_data) TYPE gts_data,
      get_parameter_list
        RETURNING VALUE(rt_parameter_list) TYPE gtt_parameter_list
        RAISING   zab_return_exc.

  PROTECTED SECTION.

    DATA:
      gv_name TYPE rs38l_fnam,
      gs_data TYPE gts_data.

    METHODS:
      init
        IMPORTING iv_name TYPE rs38l_fnam.

ENDCLASS.

CLASS zab_abap_function_module_bo IMPLEMENTATION.

  METHOD get_instance_by_name.

    rr_instance = NEW #( ).

    rr_instance->init( iv_name ).

  ENDMETHOD.

  METHOD init.

    gv_name = iv_name.

    get_data( ).

  ENDMETHOD.

  METHOD get_data.

    IF gs_data IS NOT INITIAL.
      rs_data = gs_data.
      RETURN.
    ENDIF.

    "Read BAPI metadata
    SELECT SINGLE *
      FROM tfdir
      INTO @gs_data-header
      WHERE funcname = @gv_name.

    SELECT *
      INTO TABLE @gs_data-parameters
      FROM fupararef
      WHERE funcname = @gv_name
      ORDER BY
        paramtype,
        pposition.


    LOOP AT gs_data-parameters
      ASSIGNING FIELD-SYMBOL(<ls_parameters>).

      IF <ls_parameters>-structure IS INITIAL.

        <ls_parameters>-structure = 'CHAR1'.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD get_parameter_list.

    LOOP AT gs_data-parameters
      ASSIGNING FIELD-SYMBOL(<ls_parameter_data>)
      WHERE paramtype <> 'X'.

      APPEND INITIAL LINE TO rt_parameter_list
        ASSIGNING FIELD-SYMBOL(<ls_parameter>).

      <ls_parameter>-name              = <ls_parameter_data>-parameter.
      <ls_parameter>-type              = <ls_parameter_data>-paramtype.
      <ls_parameter>-data_element_name = <ls_parameter_data>-structure.

      <ls_parameter>-data_element =
        zab_ddic_component_type=>create_component_by_name(
          CONV #( <ls_parameter_data>-structure ) ).

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS zab_bor_object_type_bo DEFINITION.

  PUBLIC SECTION.

    TYPES:
      gtv_bor_object_type_name TYPE swo_objtyp,
      gts_key_field            TYPE swotlv,

      gtt_key_field_list       TYPE STANDARD TABLE OF gts_key_field WITH DEFAULT KEY.

    CLASS-METHODS get_instance
      IMPORTING iv_object_type_name          TYPE gtv_bor_object_type_name
      RETURNING VALUE(rr_bor_object_type_bo) TYPE REF TO zab_bor_object_type_bo.

    METHODS get_key_field_list
      RETURNING VALUE(rt_key_field_list) TYPE gtt_key_field_list.

  PROTECTED SECTION.

    DATA:
      gv_object_type_name TYPE gtv_bor_object_type_name .

ENDCLASS.

CLASS zab_bor_object_type_bo IMPLEMENTATION.

  METHOD get_instance.

    rr_bor_object_type_bo = NEW #( ).

    rr_bor_object_type_bo->gv_object_type_name = iv_object_type_name.

  ENDMETHOD.

  METHOD get_key_field_list.

    SELECT *
      FROM swotlv
      WHERE
        lobjtype = @gv_object_type_name AND
        verbtype = 'K'
      ORDER BY
        editorder
      INTO TABLE @rt_key_field_list.

  ENDMETHOD.

ENDCLASS.

CLASS zab_abap_bapi_bo DEFINITION
  INHERITING FROM zab_abap_function_module_bo.

  PUBLIC SECTION.

    TYPES:
      gtv_action_type_name TYPE string.

    TYPES:
      BEGIN OF gts_key_field,
        name                TYPE string,

        structure_name      TYPE strukname,
        struc_field_name    TYPE fieldname,

        data_type           TYPE string,
        db_table_name       TYPE tabname16,
        db_table_field_name TYPE name_feld,
        data_element_name   TYPE rollname,
        parameter_type      TYPE rs38l_kind,
      END OF gts_key_field,
      gtt_key_field_list TYPE STANDARD TABLE OF gts_key_field WITH EMPTY KEY.

    CONSTANTS:
      gcc_create_action_type_name TYPE gtv_action_type_name VALUE 'CREATE',
      gcc_update_action_type_name TYPE gtv_action_type_name VALUE 'UPDATE',
      gcc_read_action_type_name   TYPE gtv_action_type_name VALUE 'READ'.

    CONSTANTS:
      gcc_bapireturn_struct_name  TYPE strukname VALUE 'BAPIRETURN',
      gcc_bapireturn1_struct_name TYPE strukname VALUE 'BAPIRETURN1',
      gcc_bapiret1_struct_name    TYPE strukname VALUE 'BAPIRET1',
      gcc_bapiret2_struct_name    TYPE strukname VALUE 'BAPIRET2'.

    TYPES:
      BEGIN OF gts_return_meta_data,
        parameter_name TYPE fupararef-parameter,
        structure_name TYPE strukname,
        parameter_type TYPE rs38l_kind,
      END OF gts_return_meta_data.

    CLASS-METHODS:
      get_bapi_by_name
        IMPORTING iv_bapi_name            TYPE rs38l_fnam
                  iv_db_table_name        TYPE tabname16
                  iv_bor_object_type_name TYPE zab_bor_object_type_bo=>gtv_bor_object_type_name
                  iv_action_type_name     TYPE gtv_action_type_name
        RETURNING VALUE(rr_instance)      TYPE REF TO zab_abap_bapi_bo.

    CLASS-METHODS check_is_return_variable
      IMPORTING iv_structure_name             TYPE strukname
      RETURNING VALUE(rv_return_variable_ind) TYPE abap_bool.

    METHODS get_key_fields
      RETURNING VALUE(rt_key_field_list) TYPE gtt_key_field_list
      RAISING   zab_return_exc.

    METHODS get_key_fields_by_param_type
      IMPORTING iv_parameter_type        TYPE gtv_parameter_type
      RETURNING VALUE(rt_key_field_list) TYPE gtt_key_field_list
      RAISING   zab_return_exc.

    METHODS get_key_parameter
      IMPORTING is_db_table_field      TYPE zab_ddic_db_table_bo=>gts_key_field
                iv_match_level         TYPE i
                iv_parameter_type      TYPE gtv_parameter_type
                is_bor_object_type_key TYPE zab_bor_object_type_bo=>gts_key_field
      RETURNING VALUE(rs_key_field)    TYPE  gts_key_field
      RAISING   zab_return_exc.

    METHODS get_return_variable_meta_data
      RETURNING VALUE(rs_return_meta_data) TYPE gts_return_meta_data.

    METHODS get_view_struc_param
      RETURNING VALUE(rs_parameter) TYPE zab_abap_function_module_bo=>gts_parameter_data.

    METHODS get_key_match_ind
      RETURNING VALUE(rv_key_match_ind) TYPE abap_bool.

  PROTECTED SECTION.

    DATA:
      gv_db_table_name            TYPE tabname16,
      gv_bor_object_type_name     TYPE zab_bor_object_type_bo=>gtv_bor_object_type_name,
      gv_action_type_name         TYPE gtv_action_type_name,

      gt_bor_object_type_key_list TYPE zab_bor_object_type_bo=>gtt_key_field_list,
      gt_db_table_key_field_list  TYPE zab_ddic_db_table_bo=>gtt_key_field_list,
      gv_key_match_ind            TYPE abap_bool,

      gt_copy_of_parameters       TYPE gtt_parameters_data.

    METHODS check_key_match
      IMPORTING iv_match_level         TYPE i
                is_ddic_field          TYPE dfies
                iv_parameter_name      TYPE rs38l_par_
                is_bor_object_type_key TYPE zab_bor_object_type_bo=>gts_key_field
                is_db_table_field      TYPE zab_ddic_db_table_bo=>gts_key_field
      RETURNING VALUE(rv_match_ind)    TYPE abap_bool.

ENDCLASS.

CLASS zab_abap_bapi_bo IMPLEMENTATION.

  METHOD get_bapi_by_name.

    rr_instance = NEW #( ).

    rr_instance->init( iv_bapi_name ).

    rr_instance->gv_db_table_name = iv_db_table_name.

    rr_instance->gv_action_type_name = iv_action_type_name.

    rr_instance->gv_bor_object_type_name = iv_bor_object_type_name.

  ENDMETHOD.

  METHOD check_is_return_variable.

    CASE iv_structure_name.

      WHEN gcc_bapireturn_struct_name OR
           gcc_bapireturn1_struct_name OR
           gcc_bapiret1_struct_name OR
           gcc_bapiret2_struct_name.

        rv_return_variable_ind = abap_true.

      WHEN OTHERS.

        rv_return_variable_ind = abap_false.

    ENDCASE.

  ENDMETHOD.

  METHOD get_key_fields.

    "Get key fields from BOR
    DATA(lr_bor_object_type_bo) =
      zab_bor_object_type_bo=>get_instance( me->gv_bor_object_type_name ).

    gt_bor_object_type_key_list =
      lr_bor_object_type_bo->get_key_field_list( ).

    DATA(lv_bor_key_field_count) = lines( gt_bor_object_type_key_list ).

    "Get key fields from DB table
    IF gv_db_table_name IS NOT INITIAL.

      DATA(lr_db_table_bo) =
        zab_ddic_db_table_bo=>get_by_name( gv_db_table_name ).

      gt_db_table_key_field_list =
        lr_db_table_bo->get_key_field_list( ).

    ENDIF.

    "Match the BOR and DB key field lists?
    IF gv_db_table_name IS NOT INITIAL AND
       lv_bor_key_field_count = lines( gt_db_table_key_field_list ) AND
       lv_bor_key_field_count > 0.

      gv_key_match_ind = abap_true.

      LOOP AT gt_bor_object_type_key_list
        ASSIGNING FIELD-SYMBOL(<ls_bor_object_type_field>).

        READ TABLE gt_db_table_key_field_list
          ASSIGNING FIELD-SYMBOL(<ls_db_table_key_field>)
          INDEX sy-tabix.

        IF <ls_bor_object_type_field>-refstruct = gv_db_table_name AND
           <ls_bor_object_type_field>-reffield  = <ls_db_table_key_field>-fieldname.

        ELSE.

          gv_key_match_ind = abap_false.

        ENDIF.

      ENDLOOP.

    ENDIF.

    "Sort parameters
    SORT gs_data-parameters
      BY paramtype
         pposition.

    "If it has a DB table name, try to find the key based on the DB table name
    IF me->gv_db_table_name IS INITIAL.

      RETURN.

    ENDIF.

    "Get key fields based on Parameter type
    CASE me->gv_action_type_name.

      WHEN gcc_create_action_type_name.

        DATA lv_param_type TYPE rs38l_kind.

        rt_key_field_list = get_key_fields_by_param_type( zab_abap_bapi_bo=>gcc_importing_param_type ).

        IF rt_key_field_list[] IS INITIAL.

          rt_key_field_list = get_key_fields_by_param_type( zab_abap_bapi_bo=>gcc_exporting_param_type ).

        ENDIF.

        IF rt_key_field_list[] IS INITIAL.

          rt_key_field_list = get_key_fields_by_param_type( zab_abap_bapi_bo=>gcc_tables_param_type ).

        ENDIF.

      WHEN gcc_read_action_type_name.

        rt_key_field_list = get_key_fields_by_param_type( zab_abap_bapi_bo=>gcc_importing_param_type ).

        IF rt_key_field_list[] IS INITIAL.

          rt_key_field_list = get_key_fields_by_param_type( zab_abap_bapi_bo=>gcc_tables_param_type ).

        ENDIF.

      WHEN OTHERS.

        rt_key_field_list = get_key_fields_by_param_type( zab_abap_bapi_bo=>gcc_importing_param_type ).

    ENDCASE.

  ENDMETHOD.

  METHOD get_key_fields_by_param_type.

    me->gt_copy_of_parameters[] = me->gs_data-parameters[].

    "Try to find the key in the importing parameters based on the DB table key
    LOOP AT gt_db_table_key_field_list
      ASSIGNING FIELD-SYMBOL(<ls_db_table_field>).

      "Get BOR object key
      IF gv_key_match_ind = abap_true.

        READ TABLE me->gt_bor_object_type_key_list
          INTO DATA(ls_bor_object_type_key)
          INDEX sy-tabix.

      ENDIF.

      DATA(ls_key_parameter) =
        get_key_parameter(
          is_db_table_field      = <ls_db_table_field>
          iv_match_level         = 1
          iv_parameter_type      = iv_parameter_type
          is_bor_object_type_key = ls_bor_object_type_key ).

      IF ls_key_parameter IS INITIAL.

        ls_key_parameter =
          get_key_parameter(
            is_db_table_field      = <ls_db_table_field>
            iv_match_level         = 2
            iv_parameter_type      = iv_parameter_type
            is_bor_object_type_key = ls_bor_object_type_key ).

      ENDIF.

      IF ls_key_parameter IS NOT INITIAL.

        APPEND ls_key_parameter
          TO rt_key_field_list.

      ENDIF.

      "Initialize
      CLEAR ls_key_parameter.
      CLEAR ls_bor_object_type_key.

    ENDLOOP.

  ENDMETHOD.

  METHOD get_key_parameter.

    DATA:
      lv_structure_name    TYPE gts_key_field-structure_name,
      lv_struct_field_name TYPE gts_key_field-struc_field_name.

    DATA(lv_match_ind) = abap_false.

    DATA(lv_parameter_name) = ||.

    LOOP AT gt_copy_of_parameters
      ASSIGNING FIELD-SYMBOL(<ls_parameter>)
      WHERE
        paramtype = iv_parameter_type.

      DATA(lv_tabix) = sy-tabix.

      DATA(lr_descr) = cl_abap_typedescr=>describe_by_name( <ls_parameter>-structure ).

      CASE lr_descr->kind.

        WHEN cl_abap_typedescr=>kind_elem.
          "If parameter data element

          DATA(lr_element_descr) = CAST cl_abap_elemdescr( lr_descr ).

          DATA(lv_is_ddic_type_ind) = lr_element_descr->is_ddic_type( ).

          IF lv_is_ddic_type_ind = abap_false.

            "This tool only support ddic fields.
            "Code error
            DATA(lr_return_exc) = zab_return_exc=>create_by_text(
              iv_message    = |This tool only support ddic fields.| ).

            RAISE EXCEPTION lr_return_exc.

          ENDIF.

          "Match
          DATA(ls_ddic) = lr_element_descr->get_ddic_field( ).

          lv_match_ind = check_key_match(
            iv_match_level         = iv_match_level
            is_ddic_field          = ls_ddic
            iv_parameter_name      = <ls_parameter>-parameter
            is_bor_object_type_key = is_bor_object_type_key
            is_db_table_field      = is_db_table_field ).

          IF lv_match_ind = abap_true.

            lv_parameter_name = <ls_parameter>-parameter.

          ENDIF.

          DATA  lv_data_type           TYPE string.

          lv_data_type = <ls_parameter>-structure.

        WHEN cl_abap_typedescr=>kind_struct.

          "If parameter is a structure
          DATA(lr_sub_struct_descr) = CAST cl_abap_structdescr( lr_descr ).

          DATA(lt_components) = lr_sub_struct_descr->get_components( ).

          LOOP AT lt_components
            ASSIGNING FIELD-SYMBOL(<ls_component>).

            CASE <ls_component>-type->kind.

              WHEN cl_abap_typedescr=>kind_elem.

                DATA(lr_sub_element_descr) = CAST cl_abap_elemdescr( <ls_component>-type ).

                DATA(ls_sub_elem_ddic_data) = lr_sub_element_descr->get_ddic_field( ).

                lv_match_ind = check_key_match(
                  iv_match_level         = iv_match_level
                  is_ddic_field          = ls_sub_elem_ddic_data
                  iv_parameter_name      = CONV rs38l_par_( <ls_component>-name )
                  is_bor_object_type_key = is_bor_object_type_key
                  is_db_table_field      = is_db_table_field ).

            ENDCASE. "Element or structure

            IF lv_match_ind = abap_true.

              IF iv_parameter_type = gcc_tables_param_type.

                lv_parameter_name    = <ls_parameter>-parameter && |[ 1 ]-| && <ls_component>-name.

              ELSE.

                lv_parameter_name = <ls_parameter>-parameter && |-| && <ls_component>-name.

              ENDIF.

              lv_structure_name    = <ls_parameter>-parameter.
              lv_struct_field_name = <ls_component>-name.

              lv_data_type         = ls_sub_elem_ddic_data-rollname.

              EXIT.

            ENDIF.

          ENDLOOP.

      ENDCASE. "Element or structure


      IF lv_match_ind = abap_true.

        EXIT.

      ENDIF.

    ENDLOOP. "Parameters

    IF lv_match_ind = abap_true.

      rs_key_field-name                = lv_parameter_name.

      rs_key_field-structure_name      = lv_structure_name.
      rs_key_field-struc_field_name    = lv_struct_field_name.

      rs_key_field-data_type           = lv_data_type.
      rs_key_field-db_table_name       = gv_db_table_name.
      rs_key_field-db_table_field_name = is_db_table_field-fieldname.
      rs_key_field-data_element_name   = is_db_table_field-rollname.
      rs_key_field-parameter_type      = <ls_parameter>-paramtype.

      DELETE gt_copy_of_parameters
        INDEX lv_tabix.

    ENDIF.

  ENDMETHOD.

  METHOD check_key_match.

    "GV_MATCH_IND kan ook nog gebruikt worden.

    CASE iv_match_level.

      WHEN  1.

        IF iv_parameter_name = is_bor_object_type_key-verb.

          rv_match_ind = abap_true.

        ELSEIF is_ddic_field-domname = is_db_table_field-domname.

          rv_match_ind = abap_true.

        ELSEIF is_ddic_field-rollname = is_db_table_field-rollname.

          rv_match_ind = abap_true.

        ENDIF.

      WHEN 2.

        IF is_ddic_field-scrtext_l = is_db_table_field-scrtext_l AND
           is_ddic_field-datatype  = is_db_table_field-datatype.

          "Match on long description

          "Sometimes even the length and datatype are not good enough to compare.
          "Example: FM: BAPI_MATERIAL_GET_DETAIL
          "- Table data element: MATNR,   internal length 80, output length 40
          "- BAPI data element : MATNR18, internal length 36, output length 18

          rv_match_ind = abap_true.

        ENDIF.

      WHEN 3.

        IF
          is_ddic_field-datatype = is_db_table_field-datatype AND
          is_ddic_field-leng     = is_db_table_field-leng AND
          is_ddic_field-decimals = is_db_table_field-decimals.

          rv_match_ind = abap_true.

        ENDIF.

    ENDCASE.

  ENDMETHOD.

  METHOD get_return_variable_meta_data.

    LOOP AT gs_data-parameters
      ASSIGNING FIELD-SYMBOL(<ls_parameter>)
      WHERE paramtype = 'E' OR
            paramtype = 'T'.

      IF check_is_return_variable( CONV #( <ls_parameter>-structure ) ).

        IF <ls_parameter>-paramtype = 'E' OR
           <ls_parameter>-paramtype = 'T'.

          rs_return_meta_data-structure_name = <ls_parameter>-structure.
          rs_return_meta_data-parameter_type = <ls_parameter>-paramtype.

          EXIT.

        ENDIF.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD get_key_match_ind.

    rv_key_match_ind = gv_key_match_ind.

  ENDMETHOD.

  METHOD get_view_struc_param.

    LOOP AT gs_data-parameters
      ASSIGNING FIELD-SYMBOL(<ls_parameter>)
      WHERE paramtype = 'I'.

      IF <ls_parameter>-parameter = 'I_BAPI_VIEW'.

        rs_parameter = <ls_parameter>.

        RETURN.

      ELSE.

        DATA(lr_type_descr) = cl_abap_structdescr=>describe_by_name( <ls_parameter>-structure ).

        CASE lr_type_descr->kind.

          WHEN cl_abap_typedescr=>kind_struct.

            DATA(lr_struct_descr) = CAST cl_abap_structdescr( lr_type_descr ).

            DATA(lt_components) = lr_struct_descr->get_components( ).

            DATA(lv_is_view_parameter) = abap_true.

            LOOP AT lt_components
              ASSIGNING FIELD-SYMBOL(<ls_component>).

              CASE <ls_component>-type->kind.

                WHEN cl_abap_typedescr=>kind_elem.

                  DATA(lr_element_descr) = CAST cl_abap_elemdescr( <ls_component>-type ).

                  IF lr_element_descr->is_ddic_type( ) = abap_false.

                    lv_is_view_parameter = abap_false.

                  ENDIF.

                  DATA(ls_ddic) = lr_element_descr->get_ddic_field( ).

                  IF ls_ddic-domname <> 'XFELD'.

                    lv_is_view_parameter = abap_false.

                  ENDIF.

                  "OK!

                WHEN OTHERS.

                  lv_is_view_parameter = abap_false.

              ENDCASE.

            ENDLOOP.

            IF lv_is_view_parameter = abap_true.

              rs_parameter = <ls_parameter>.

              RETURN.

            ENDIF.

          WHEN OTHERS.

            CONTINUE.

        ENDCASE.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS zab_abap_class_code_bo DEFINITION
  INHERITING FROM zab_abap_code_bo.

  PUBLIC SECTION.

    TYPES:
      gtv_prefix_name       TYPE c LENGTH 1,
      gtv_module_abbrev     TYPE c LENGTH 3,
      gtv_bo_object_name    TYPE icl_indx_srtfd,
      gtv_abap_object_name  TYPE icl_indx_srtfd,
      gtv_class_type_abbrev TYPE c LENGTH 3,


      gtv_section_name      TYPE c LENGTH 10,

      gtt_interfaces        TYPE STANDARD TABLE OF seoclsname WITH DEFAULT KEY,

      BEGIN OF gts_create_new,
        prefix_name       TYPE gtv_prefix_name,
        module_abbrev     TYPE gtv_module_abbrev,
        bo_object_name    TYPE gtv_bo_object_name,
        abap_object_name  TYPE gtv_abap_object_name,
        class_type_abbrev TYPE gtv_class_type_abbrev,
      END OF gts_create_new,

      BEGIN OF gts_type,
        abap_type_code TYPE REF TO zab_abap_type_code_bo,
      END OF gts_type,

      BEGIN OF gts_attribute,
        abap_type_code TYPE REF TO zab_abap_data_code_bo,
      END OF gts_attribute,

      gtv_alias_name     TYPE c LENGTH 30,
      gtv_component_name TYPE c LENGTH 100,
      BEGIN OF gts_alias,
        alias_name     TYPE gtv_alias_name,
        component_name TYPE gtv_component_name,
      END OF gts_alias,
      gtt_aliases TYPE STANDARD TABLE OF gts_alias WITH EMPTY KEY,

      BEGIN OF gts_section,
        name           TYPE gtv_section_name,
        interfaces     TYPE gtt_interfaces,
        type_list      TYPE STANDARD TABLE OF gts_type WITH EMPTY KEY,
        attribute_list TYPE STANDARD TABLE OF gts_attribute WITH EMPTY KEY,
        aliases        TYPE gtt_aliases,
        method_list    TYPE STANDARD TABLE OF zab_abap_method_code_bo=>gts_data WITH EMPTY KEY,
      END OF gts_section,

      BEGIN OF gts_data,

        prefix_name       TYPE gtv_prefix_name,
        module_abbrev     TYPE gtv_module_abbrev,
        bo_object_name    TYPE gtv_bo_object_name,
        abap_object_name  TYPE gtv_abap_object_name,
        class_type_abbrev TYPE gtv_class_type_abbrev,

        class_name        TYPE seoclsname,
        variable_name     TYPE seocpdname,

        sections          TYPE STANDARD TABLE OF gts_section WITH EMPTY KEY,

      END OF gts_data.

    CONSTANTS:
      gcc_section_public    TYPE gtv_section_name VALUE 'public',
      gcc_section_protected TYPE gtv_section_name VALUE 'protected',
      gcc_section_private   TYPE gtv_section_name VALUE 'private'.

    CLASS-METHODS:
      create_new
        IMPORTING is_create_new      TYPE gts_create_new
        RETURNING VALUE(rr_instance) TYPE REF TO zab_abap_class_code_bo.

    METHODS:
      get_data
        RETURNING VALUE(rs_data) TYPE gts_data,

      add_alias
        IMPORTING iv_section TYPE gtv_section_name
                  it_aliases TYPE gtt_aliases,

      add_type_code
        IMPORTING iv_section   TYPE gtv_section_name
                  it_type_list TYPE zab_abap_type_code_bo=>gtt_type_list,

      add_data_code
        IMPORTING iv_section   TYPE gtv_section_name
                  it_data_list TYPE zab_abap_type_code_bo=>gtt_type_list,
      add_method_code
        IMPORTING iv_section TYPE gtv_section_name
                  is_method  TYPE zab_abap_method_code_bo=>gts_data,

      add_interface_code
        IMPORTING iv_section    TYPE gtv_section_name
                  it_interfaces TYPE gtt_interfaces.

  PROTECTED SECTION.

    TYPES:
      gtv_class_type TYPE string,

      BEGIN OF gts_protected_data,
        class_type TYPE gtv_class_type,
      END OF gts_protected_data.

    CONSTANTS:
      gcc_class_class_type     TYPE gtv_class_type VALUE 'CLASS',
      gcc_interface_class_type TYPE gtv_class_type VALUE 'INTERFACE'.


    DATA:
      gs_data           TYPE gts_data,
      gs_protected_data TYPE gts_protected_data.

    METHODS:
      init
        IMPORTING is_create_new TYPE gts_create_new,

      generate_code REDEFINITION,
      get_definition
        RAISING zab_return_exc,
      get_section_code
        IMPORTING iv_section TYPE gtv_section_name
        RAISING   zab_return_exc,
      get_implementation.

ENDCLASS.

CLASS zab_abap_class_code_bo IMPLEMENTATION.

  METHOD create_new.

    rr_instance = NEW #( ).

    "Class type
    rr_instance->gs_protected_data-class_type = gcc_class_class_type.

    rr_instance->init(
      is_create_new ).

  ENDMETHOD.

  METHOD init.

    DATA(rr_instance) = me.

    "Set values
    rr_instance->gs_data-prefix_name        = is_create_new-prefix_name.

    rr_instance->gs_data-module_abbrev      = is_create_new-module_abbrev.

    rr_instance->gs_data-bo_object_name     = is_create_new-bo_object_name.

    rr_instance->gs_data-abap_object_name   = is_create_new-abap_object_name.

    rr_instance->gs_data-class_type_abbrev  =  is_create_new-class_type_abbrev.

    rr_instance->gs_data-class_name =
      is_create_new-prefix_name &&
      is_create_new-module_abbrev && |_| &&
      is_create_new-abap_object_name && |_| &&
      is_create_new-class_type_abbrev.

    rr_instance->gs_data-variable_name =
      is_create_new-abap_object_name && |_| &&
      is_create_new-class_type_abbrev.

    APPEND INITIAL LINE TO rr_instance->gs_data-sections
      ASSIGNING FIELD-SYMBOL(<ls_section>).
    <ls_section>-name = gcc_section_public.

    APPEND INITIAL LINE TO rr_instance->gs_data-sections
      ASSIGNING <ls_section>.
    <ls_section>-name = gcc_section_protected.

    APPEND INITIAL LINE TO rr_instance->gs_data-sections
      ASSIGNING <ls_section>.
    <ls_section>-name = gcc_section_private.

  ENDMETHOD.

  METHOD get_data.

    rs_data = gs_data.

  ENDMETHOD.

  METHOD add_interface_code.

    READ TABLE gs_data-sections
      WITH KEY name = iv_section
      ASSIGNING FIELD-SYMBOL(<ls_section>).

    LOOP AT it_interfaces
      ASSIGNING FIELD-SYMBOL(<lv_interface>).

      APPEND INITIAL LINE TO <ls_section>-interfaces
        ASSIGNING FIELD-SYMBOL(<lv_target_interface>).

      <lv_target_interface> = <lv_interface>.

    ENDLOOP.

  ENDMETHOD.

  METHOD add_alias.

    READ TABLE gs_data-sections
      WITH KEY name = iv_section
      ASSIGNING FIELD-SYMBOL(<ls_section>).

    LOOP AT it_aliases
      ASSIGNING FIELD-SYMBOL(<ls_alias>).

      APPEND INITIAL LINE TO <ls_section>-aliases
        ASSIGNING FIELD-SYMBOL(<ls_target_alias>).

      <ls_target_alias> = <ls_alias>.

    ENDLOOP.

  ENDMETHOD.

  METHOD add_type_code.

    READ TABLE gs_data-sections
      WITH KEY name = iv_section
      ASSIGNING FIELD-SYMBOL(<ls_section>).

    APPEND INITIAL LINE TO <ls_section>-type_list
      ASSIGNING FIELD-SYMBOL(<ls_type>).

    <ls_type>-abap_type_code =
      zab_abap_type_code_bo=>create_instance_by_data( it_type_list ).

  ENDMETHOD.

  METHOD add_data_code.

    READ TABLE gs_data-sections
      WITH KEY name = iv_section
      ASSIGNING FIELD-SYMBOL(<ls_section>).

    APPEND INITIAL LINE TO <ls_section>-attribute_list
      ASSIGNING FIELD-SYMBOL(<ls_type>).

    <ls_type>-abap_type_code =
      zab_abap_data_code_bo=>create_data_code_by_data( it_data_list ).

  ENDMETHOD.

  METHOD add_method_code.

    READ TABLE gs_data-sections
      WITH KEY name = iv_section
      ASSIGNING FIELD-SYMBOL(<ls_section>).

    APPEND INITIAL LINE TO <ls_section>-method_list
      ASSIGNING FIELD-SYMBOL(<ls_method>).

    <ls_method> = is_method.

  ENDMETHOD.

  METHOD generate_code.

    get_definition( ).

    get_implementation( ).

  ENDMETHOD.

  METHOD get_definition.

    me->add_code_line( || ).

    "Begin
    CASE gs_protected_data-class_type.

      WHEN gcc_class_class_type.

        me->add_code_line(
          |CLASS | && to_lower( gs_data-class_name ) && | DEFINITION.| ).

      WHEN gcc_interface_class_type.

        me->add_code_line(
          |INTERFACE | && to_lower( gs_data-class_name ) && |.| ).

    ENDCASE.

    "Sections
    get_section_code( gcc_section_public ).

    get_section_code( gcc_section_protected ).

    get_section_code( gcc_section_private ).

    "End
    me->add_code_line( || ).
    CASE gs_protected_data-class_type.

      WHEN gcc_class_class_type.

        me->add_code_line( |ENDCLASS.| ).

      WHEN gcc_interface_class_type.

        me->add_code_line( |ENDINTERFACE.| ).

    ENDCASE.

  ENDMETHOD.

  METHOD get_implementation.

    me->add_code_line( '' ).

    me->add_code_line(
      |CLASS | && to_lower( gs_data-class_name ) && | IMPLEMENTATION.| ).

    "Add the methods

    LOOP AT gs_data-sections
      ASSIGNING FIELD-SYMBOL(<ls_section>).

      LOOP AT <ls_section>-method_list
        ASSIGNING FIELD-SYMBOL(<ls_method>).

        DATA(lr_abap_method_code) =
          zab_abap_method_code_bo=>create_instance_by_data( <ls_method> ).

        DATA(lt_method_code) = lr_abap_method_code->get_implementation_code( ).

        me->add_code_line( || ).

        me->add_code_lines( lt_method_code ).

      ENDLOOP.

    ENDLOOP.


    me->add_code_line( '' ).

    me->add_code_line(
      |ENDCLASS.| ).

  ENDMETHOD.

  METHOD get_section_code.

    "Add SECTION. statement - only for class not for class interface
    CASE me->gs_protected_data-class_type.

      WHEN gcc_class_class_type.

        me->add_code_line( | | ).

        me->add_code_line(
          |  | && to_upper( iv_section ) && | SECTION.| ).

    ENDCASE.

    "Get section
    READ TABLE gs_data-sections
      WITH KEY name = iv_section
      ASSIGNING FIELD-SYMBOL(<ls_section>).

    "**********************************************************
    "Interfaces
    LOOP AT <ls_section>-interfaces
      ASSIGNING FIELD-SYMBOL(<lv_interface>).

      IF sy-tabix = 1.

        me->add_code_line( || ).
        me->add_code_line(
          |    INTERFACES:| ).

      ENDIF.

      IF sy-tabix < lines( <ls_section>-interfaces ).
        DATA(lv_separator) = ','.
      ELSE.
        lv_separator = '.'.
      ENDIF.

      me->add_code_line(
        |      { to_lower( <lv_interface> ) }{ lv_separator }| ).

    ENDLOOP.

    "**********************************************************
    "Aliases
    LOOP AT <ls_section>-aliases
      ASSIGNING FIELD-SYMBOL(<ls_alias>).

      IF sy-tabix < lines( <ls_section>-aliases ).
        lv_separator = ','.
      ELSE.
        lv_separator = '.'.
      ENDIF.

      IF sy-tabix = 1.

        me->add_code_line( || ).
        me->add_code_line(
          |    ALIASES:| ).

      ENDIF.

      DATA(lv_alias_name) =
        zab_abap_text_bo=>add_trailing_space(
          iv_text        = <ls_alias>-alias_name
          iv_length      = 30 ).



      me->add_code_line(
        |      { to_lower( lv_alias_name ) } FOR { to_lower( <ls_alias>-component_name ) }{ lv_separator }| ).

    ENDLOOP.


    "Add the methods definitions


    LOOP AT <ls_section>-method_list
      ASSIGNING FIELD-SYMBOL(<ls_method>).

      IF <ls_method>-alias_component_name IS INITIAL.
        CONTINUE.
      ENDIF.

      IF sy-tabix < lines( <ls_section>-method_list ).
        lv_separator = ','.
      ELSE.
        lv_separator = '.'.
      ENDIF.

      IF sy-tabix = 1.

        me->add_code_line( || ).
        me->add_code_line(
          |    ALIASES:| ).

      ENDIF.

      lv_alias_name =
        zab_abap_text_bo=>add_trailing_space(
          iv_text        = <ls_method>-name
          iv_length      = 30 ).

      me->add_code_line(
        |      { to_lower( lv_alias_name ) } FOR { to_lower( <ls_method>-alias_component_name ) }{ lv_separator }| ).

    ENDLOOP.

    "**********************************************************
    "Add the types
    IF me->gs_protected_data-class_type = gcc_interface_class_type.

      DATA(lv_level) = 1.

    ELSE.

      lv_level = 2.

    ENDIF.

    LOOP AT <ls_section>-type_list
      ASSIGNING FIELD-SYMBOL(<ls_type>).

      IF <ls_type>-abap_type_code IS INITIAL.
        CONTINUE.
      ENDIF.

      DATA(lt_types_code) =
        <ls_type>-abap_type_code->get_code_lines(
          iv_code_level = lv_level ).

      me->add_code_line( || ).

      me->add_code_lines( lt_types_code ).

    ENDLOOP.

    "**********************************************************
    "Add the attributes
    LOOP AT <ls_section>-attribute_list
      ASSIGNING FIELD-SYMBOL(<ls_attribute>).

      IF <ls_attribute>-abap_type_code IS INITIAL.
        CONTINUE.
      ENDIF.

      DATA(lt_data_code) =
        <ls_attribute>-abap_type_code->get_code_lines(
          iv_code_level = lv_level ).

      me->add_code_line( || ).

      me->add_code_lines( lt_data_code ).

    ENDLOOP.

    "**********************************************************
    "Add the methods definitions
    LOOP AT <ls_section>-method_list
      ASSIGNING <ls_method>.

      IF <ls_method>-alias_component_name IS NOT INITIAL.
        CONTINUE.
      ENDIF.

      DATA(lr_abap_method_code) =
        zab_abap_method_code_bo=>create_instance_by_data( <ls_method> ).

      DATA(lt_method_code) = lr_abap_method_code->get_definition_code( lv_level ).

      me->add_code_line( || ).

      me->add_code_lines( lt_method_code ).

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS zab_abap_class_interf_code_bo DEFINITION
    INHERITING FROM zab_abap_class_code_bo.

  PUBLIC SECTION.

    CLASS-METHODS:
      create_new_interface
        IMPORTING is_create_new      TYPE gts_create_new
        RETURNING VALUE(rr_instance) TYPE REF TO zab_abap_class_interf_code_bo.

  PROTECTED SECTION.

    METHODS:
      generate_code REDEFINITION.

ENDCLASS.

CLASS zab_abap_class_interf_code_bo IMPLEMENTATION.

  METHOD create_new_interface.

    rr_instance = NEW #( ).

    "Class type
    rr_instance->gs_protected_data-class_type = gcc_interface_class_type.

    rr_instance->init(
      is_create_new = is_create_new ).

  ENDMETHOD.

  METHOD generate_code.

    get_definition( ).

  ENDMETHOD.

ENDCLASS.

CLASS zab_abap_program_code_bo DEFINITION
  INHERITING FROM zab_abap_code_bo.

  PUBLIC SECTION.

    TYPES:
      gtv_event_name        TYPE c LENGTH 30,  "ABAP program events like START-OF-SELECTION.
      gtv_screen_field_name TYPE c LENGTH 8,
      gtv_screen_field_type TYPE c LENGTH 1,  "P = Parameters, S = Select-option

      BEGIN OF gts_sel_screen_field,
        name           TYPE gtv_screen_field_name,
        type_type      TYPE gtv_screen_field_type,
        type_name      TYPE gtv_data_element_path_name,
        no_display_ind TYPE abap_bool,
        default_value  TYPE string,
        comment        TYPE string,
      END OF gts_sel_screen_field,
      gtt_sel_screen_fields TYPE STANDARD TABLE OF gts_sel_screen_field WITH DEFAULT KEY,

      BEGIN OF gts_header,
        name TYPE programm,
      END OF gts_header,

      BEGIN OF gts_add_event,
        name      TYPE gtv_event_name,
        code_list TYPE zab_abap_code_bo=>gtt_lines,
      END OF gts_add_event.

    CONSTANTS:
      gcc_load_of_program            TYPE gtv_event_name VALUE 'LOAD-OF-PROGRAM',
      gcc_at_selection_screen_output TYPE gtv_event_name VALUE 'AT SELECTION-SCREEN OUTPUT',  "PBO
      gcc_at_selection_screen        TYPE gtv_event_name VALUE 'AT SELECTION-SCREEN',         "PAI
      gcc_start_of_sel_event         TYPE gtv_event_name VALUE 'START-OF-SELECTION'.

    CLASS-METHODS:
      get_instance
        IMPORTING iv_program_name            TYPE programm
                  iv_cache_ind               TYPE abap_bool DEFAULT abap_true
        RETURNING VALUE(rr_abap_report_code) TYPE REF TO zab_abap_program_code_bo
        RAISING   zab_return_exc.

    CLASS-METHODS:
      create_new
        IMPORTING is_create                  TYPE gts_header
        RETURNING VALUE(rr_abap_report_code) TYPE REF TO zab_abap_program_code_bo.

    METHODS get_abap_class_lines
      IMPORTING iv_class_name   TYPE seoclsname
      RETURNING VALUE(rt_lines) TYPE zab_abap_code_bo=>gtt_lines
      RAISING   zab_return_exc.

    METHODS:
      add_abap_class
        IMPORTING ir_abap_class_code TYPE REF TO zab_abap_class_code_bo,
      add_sel_screen_parameter
        IMPORTING is_sel_screen_field TYPE gts_sel_screen_field,
      add_global_variable
        IMPORTING is_variable TYPE zab_abap_data_code_bo=>gts_type,
      add_event_code
        IMPORTING is_add_event TYPE gts_add_event.

  PROTECTED SECTION.

    TYPES:
      BEGIN OF gts_class,
        abap_class_code TYPE REF TO zab_abap_class_code_bo,
      END OF gts_class,

      BEGIN OF gts_event,
        name      TYPE gtv_event_name,
        code_list TYPE zab_abap_type_code_bo=>gtt_lines,
      END OF gts_event,

      BEGIN OF gts_data,
        header            TYPE gts_header,
        class_list        TYPE STANDARD TABLE OF gts_class WITH EMPTY KEY,
        sel_screen_fields TYPE gtt_sel_screen_fields,
        variable_list     TYPE zab_abap_data_code_bo=>gtt_type_list,
        event_list        TYPE STANDARD TABLE OF gts_event WITH EMPTY KEY,
      END OF gts_data.

    TYPES:
      gtv_state_name TYPE c LENGTH 20.

    CONSTANTS:
      gc_new_state_name      TYPE gtv_state_name VALUE 'NEW',
      gc_existing_state_name TYPE gtv_state_name VALUE 'EXISTING'.

    CLASS-DATA:
      gr_static_report_code_bo TYPE REF TO zab_abap_program_code_bo,
      gv_static_program_name   TYPE programm.
*        gt_static_code_lines   TYPE gtt_lines.

    DATA:
      gv_program_name TYPE programm,
      gv_state_name   TYPE gtv_state_name,
      gs_data         TYPE gts_data.

    METHODS:
      generate_code REDEFINITION,
      generate_event_code
        IMPORTING iv_event_name TYPE gtv_event_name.

ENDCLASS.

CLASS zab_abap_program_code_bo IMPLEMENTATION.

  METHOD get_instance.

    IF iv_cache_ind = abap_true.

      IF gr_static_report_code_bo IS NOT INITIAL.

        IF gr_static_report_code_bo->gv_program_name = iv_program_name.

          rr_abap_report_code = gr_static_report_code_bo.

          RETURN.

        ENDIF.

      ENDIF.

    ENDIF.

    "Read program code
    rr_abap_report_code = NEW #( ).

    rr_abap_report_code->gv_program_name = iv_program_name.

    rr_abap_report_code->gv_state_name = gc_existing_state_name.

    READ REPORT iv_program_name
      INTO rr_abap_report_code->gt_code_lines.

    IF sy-subrc <> 0.

      DATA(lr_return_exc) =
        zab_return_exc=>create_by_text(
          |Problems read ABAP program | && iv_program_name && |.| ).

      RAISE EXCEPTION lr_return_exc.

    ENDIF.

    "Cache program
    IF iv_cache_ind = abap_true.

      gv_static_program_name = iv_program_name.

      gr_static_report_code_bo =  rr_abap_report_code.

    ENDIF.

  ENDMETHOD.

  METHOD create_new.

    rr_abap_report_code = NEW #( ).

    rr_abap_report_code->gv_state_name = gc_new_state_name.

    rr_abap_report_code->gs_data-header = is_create.

    TRANSLATE rr_abap_report_code->gs_data-header-name TO UPPER CASE.

    rr_abap_report_code->add_code_line(
      |REPORT | && to_lower( rr_abap_report_code->gs_data-header-name ) && |.| ).

    rr_abap_report_code->add_code_line( '' ).

  ENDMETHOD.

  METHOD get_abap_class_lines.

    CASE me->gv_state_name.

      WHEN me->gc_existing_state_name.

      WHEN OTHERS.

        DATA(lr_return_exc) =
          zab_return_exc=>create_by_text(
            |State name { gv_state_name } not yet supported. Program: { me->gv_program_name }.| ).

        RAISE EXCEPTION lr_return_exc.

    ENDCASE.

    TYPES ltv_line_state TYPE c LENGTH 28.

    DATA lt_lines TYPE zab_abap_code_bo=>gtt_lines.

    DATA lv_line_state TYPE ltv_line_state.

    DATA(lv_program_name) = me->gv_program_name.

    DATA lv_class_name TYPE seoclsname.

    lv_class_name = to_lower( iv_class_name ).

    DATA(lt_code_lines) =
      get_code_lines(
        iv_code_level = 1 ).

    LOOP AT lt_code_lines
      ASSIGNING FIELD-SYMBOL(<lv_code_line>).

      CASE lv_line_state.

        WHEN ''.

          FIND |CLASS |  && lv_class_name && | DEFINITION|
            IN <lv_code_line>
            IN CHARACTER MODE.

          IF sy-subrc = 0.
            lv_line_state = 'DEFINITION'.
          ENDIF.

        WHEN 'DEFINITION'.

          FIND 'ENDCLASS.'
           IN <lv_code_line>
           IN CHARACTER MODE.

          IF sy-subrc = 0.

            lv_line_state = 'DEFINITION LAST LINE'.

          ENDIF.

        WHEN 'DEFINITION LAST LINE' OR 'WAIT FOR IMPLEMENTATION'.

          IF lv_line_state = 'DEFINITION LAST LINE'.
            lv_line_state = 'WAIT FOR IMPLEMENTATION'.
          ENDIF.

          FIND |CLASS |  && lv_class_name && | IMPLEMENTATION.|
            IN <lv_code_line>
            IN CHARACTER MODE.

          IF sy-subrc = 0.

            lv_line_state = 'IMPLEMENTATION'.

            "Add empty line
            APPEND INITIAL LINE TO lt_lines
              ASSIGNING FIELD-SYMBOL(<lv_line_2>).

          ENDIF.

        WHEN 'IMPLEMENTATION'.

          FIND 'ENDCLASS.'
            IN <lv_code_line>
            IN CHARACTER MODE.

          IF sy-subrc = 0.

            lv_line_state = 'IMPLEMENTATION LAST LINE'.

          ENDIF.


        WHEN 'IMPLEMENTATION LAST LINE'.

          EXIT.

      ENDCASE.

      IF lv_line_state = 'DEFINITION' OR
         lv_line_state = 'DEFINITION LAST LINE' OR
         lv_line_state = 'IMPLEMENTATION' OR
         lv_line_state = 'IMPLEMENTATION LAST LINE'.

        APPEND INITIAL LINE TO lt_lines
          ASSIGNING FIELD-SYMBOL(<lv_line>).

        <lv_line> = <lv_code_line>.

      ENDIF.

    ENDLOOP.

    IF lv_line_state <> 'IMPLEMENTATION LAST LINE'.

      lr_return_exc =
        zab_return_exc=>create_by_text(
          |Class |  && lv_class_name && | not found in program | && lv_program_name && |.| ).

      RAISE EXCEPTION lr_return_exc.

    ENDIF.

    rt_lines = lt_lines.

  ENDMETHOD.

  METHOD add_abap_class.

    APPEND INITIAL LINE TO gs_data-class_list
      ASSIGNING FIELD-SYMBOL(<ls_class>).

    <ls_class>-abap_class_code =
      ir_abap_class_code.

  ENDMETHOD.

  METHOD add_sel_screen_parameter.

    APPEND INITIAL LINE TO gs_data-sel_screen_fields
      ASSIGNING FIELD-SYMBOL(<ls_sel_screen_field>).

    <ls_sel_screen_field> = is_sel_screen_field.

  ENDMETHOD.

  METHOD add_global_variable.

    APPEND INITIAL LINE TO gs_data-variable_list
      ASSIGNING FIELD-SYMBOL(<ls_variable>).

    <ls_variable> = is_variable.

  ENDMETHOD.

  METHOD add_event_code.

    READ TABLE gs_data-event_list
      WITH KEY name = is_add_event-name
      ASSIGNING FIELD-SYMBOL(<ls_event>).

    IF sy-subrc <> 0.

      APPEND INITIAL LINE TO gs_data-event_list
        ASSIGNING <ls_event>.
      <ls_event>-name = is_add_event-name.

    ENDIF.

*    "Add empty line.
*    APPEND INITIAL LINE TO <ls_event>-code_list
*      ASSIGNING FIELD-SYMBOL(<ls_code>).

    "Add lines
    APPEND LINES OF is_add_event-code_list TO <ls_event>-code_list.

  ENDMETHOD.

  METHOD generate_code.

    CASE gv_state_name.

      WHEN gc_existing_state_name.

        "Nothing to generate

      WHEN gc_new_state_name.

        "Add classes
        LOOP AT gs_data-class_list
          ASSIGNING FIELD-SYMBOL(<ls_class>).

          IF sy-tabix > 1.

            me->add_code_line( || ).

          ENDIF.

          DATA(lt_code_lines) =
            <ls_class>-abap_class_code->get_code_lines(
              iv_code_level = 1 ).

          me->add_code_lines( lt_code_lines ).

        ENDLOOP.

        DATA(lv_sel_scrn_field_count) = lines( gs_data-sel_screen_fields ).

        IF lv_sel_scrn_field_count > 0.

          "Empty line
          me->add_code_line( || ).

          LOOP AT gs_data-sel_screen_fields
            ASSIGNING FIELD-SYMBOL(<ls_sel_screen_field>).

            DATA(lv_screen_field_index) = sy-tabix.

            CASE <ls_sel_screen_field>-type_type.

              WHEN 'P'.

                me->add_code_line(
                  |PARAMETERS | &&
                    |{ zab_abap_text_bo=>add_trailing_space(
                       iv_text    = to_lower( <ls_sel_screen_field>-name )
                       iv_length  = 8 ) }| &&

                  "Data type
                  | TYPE | &&

                  |{ zab_abap_text_bo=>add_trailing_space(
                       iv_text    = to_lower( <ls_sel_screen_field>-type_name )
                       iv_length  = 10 ) }| &&

                  "NO-DISPLAY
                  COND string(
                    WHEN <ls_sel_screen_field>-no_display_ind = abap_true
                      THEN | NO-DISPLAY|
                    ELSE || ) &&

                  "Default value
                  COND string(
                    WHEN <ls_sel_screen_field>-default_value IS NOT INITIAL
                      THEN | DEFAULT { <ls_sel_screen_field>-default_value }|
                    ELSE || ) &&

                  "End of statement
                  |.| &&

                  "Default value
                  COND string(
                    WHEN <ls_sel_screen_field>-comment IS NOT INITIAL
                      THEN | "{ <ls_sel_screen_field>-comment }|
                    ELSE || )

                ).

              WHEN OTHERS.

                DATA(lx_return) = zab_return_exc=>create_by_text(
                  iv_message    = 'Screen field type &1 is not known.'
                  iv_field_name = |sel_screen_fields[{ lv_screen_field_index }]-type_type|
                  iv_variable_1 = CONV #( <ls_sel_screen_field>-type_type ) ).

                RAISE EXCEPTION lx_return.

            ENDCASE.

          ENDLOOP.

        ENDIF.

        "Add variable
        IF lines( gs_data-variable_list ) > 0.

          "Empty line
          me->add_code_line( || ).

          DATA(lr_data_code) =
            zab_abap_data_code_bo=>create_data_code_by_data(
               it_type_list  = gs_data-variable_list ).

          DATA(lt_data_code_lines) =
            lr_data_code->get_code_lines(
              iv_code_level = 0 ).

          me->add_code_lines( lt_data_code_lines ).

        ENDIF.

        "Generate event code
        generate_event_code( gcc_load_of_program ).

        generate_event_code( gcc_at_selection_screen_output ).

        generate_event_code( gcc_at_selection_screen ).

        generate_event_code( gcc_start_of_sel_event ).

      WHEN OTHERS.

        DATA(lr_return_exc) =
          zab_return_exc=>create_by_text(
            |Wrong state name | && gv_state_name && | in program { me->gv_program_name }| ).

        RAISE EXCEPTION lr_return_exc.

    ENDCASE.

  ENDMETHOD.

  METHOD generate_event_code.

    READ TABLE gs_data-event_list
      ASSIGNING FIELD-SYMBOL(<ls_event>)
      WITH KEY name = iv_event_name.

    IF sy-subrc = 0.

      me->add_code_line( || ).

      me->add_code_line(
        iv_event_name && |.| ).

      me->add_code_lines( <ls_event>-code_list ).

    ENDIF.

  ENDMETHOD.

ENDCLASS.

CLASS zbo_abap_bapi_cls_gen_prc DEFINITION
  INHERITING FROM zdp_abstract_data_provider
  CREATE PROTECTED.

  PUBLIC SECTION.

    TYPES:
      BEGIN OF gts_class,
        module_abbrev        TYPE zab_abap_class_code_bo=>gtv_module_abbrev,
        bo_object_name       TYPE zab_abap_class_code_bo=>gtv_bo_object_name,
        abap_object_name     TYPE zab_abap_class_code_bo=>gtv_abap_object_name,
        main_db_table_name   TYPE tabname16,
        bor_object_type_name TYPE zab_bor_object_type_bo=>gtv_bor_object_type_name,
        message_class_name   TYPE arbgb,
        key_ind              TYPE abap_bool,
        interface_ind        TYPE abap_bool,

        read_ind             TYPE abap_bool,
        create_ind           TYPE abap_bool,
        update_ind           TYPE abap_bool,
        non_cru_ind          TYPE abap_bool,

      END OF gts_class,

      BEGIN OF gts_bapis,
        read_bapi         TYPE rs38l_fnam,
        create_bapi       TYPE rs38l_fnam,
        update_bapi       TYPE rs38l_fnam,
        non_cru_bapis_rng TYPE RANGE OF rs38l_fnam,
      END OF gts_bapis,

      BEGIN OF gts_test_program,
        create_ind                  TYPE abap_bool,
        instantiate_call_ind        TYPE abap_bool,

        read_call_ind               TYPE abap_bool,

        create_object_call_ind      TYPE abap_bool,
        create_data_out_comment_ind TYPE abap_bool,

        update_object_call_ind      TYPE abap_bool,
        update_out_comment_ind      TYPE abap_bool,

        non_cru_ind                 TYPE abap_bool,

        text_bo_ind                 TYPE abap_bool,
        abap_struct_descr_ind       TYPE abap_bool,
        deep_struct_vw_ind          TYPE abap_bool,
        alv_tree_vw_ind             TYPE abap_bool,
        db_transaction_ind          TYPE abap_bool,

      END OF gts_test_program,

      BEGIN OF gts_bo_frame_work,
        exception_class_ind  TYPE abap_bool,
        excep_class_view_ind TYPE abap_bool,
      END OF gts_bo_frame_work,

      BEGIN OF gts_naming,
        naming_name TYPE zab_abap_naming_bo=>gtv_naming_name,
      END OF gts_naming,

      BEGIN OF gts_parameters,
        bapis         TYPE gts_bapis,
        class         TYPE gts_class,
        test_program  TYPE gts_test_program,
        bo_frame_work TYPE gts_bo_frame_work,
        naming        TYPE gts_naming,
      END OF gts_parameters,

      BEGIN OF gts_correct_parameters,
        parameters     TYPE gts_parameters,
        field_settings TYPE gtt_field_settings,
      END OF gts_correct_parameters.

    CLASS-METHODS:
      create
        IMPORTING is_parameters      TYPE gts_parameters
        RETURNING VALUE(rr_instance) TYPE REF TO zbo_abap_bapi_cls_gen_prc.

    TYPES:
      BEGIN OF gts_validate,
        return_tab TYPE bapiret2_tab,
      END OF gts_validate.

    METHODS get_corrected_parameters
      IMPORTING is_new_parameters TYPE gts_parameters
      RETURNING VALUE(rs_return)  TYPE gts_correct_parameters.

    METHODS validate
      RETURNING VALUE(rs_validate) TYPE gts_validate.

    METHODS start
      RETURNING VALUE(rv_code) TYPE string
      RAISING   zab_return_exc.


  PROTECTED SECTION.

    TYPES:
      BEGIN OF gts_references,
        read_bapi   TYPE REF TO zab_abap_bapi_bo,
        create_bapi TYPE REF TO zab_abap_bapi_bo,
        update_bapi TYPE REF TO zab_abap_bapi_bo,
      END OF gts_references,

      BEGIN OF gts_variable_names,
        variable_name  TYPE zab_abap_code_bo=>gtv_variable_name,
        data_type_name TYPE string,
      END OF gts_variable_names,

      BEGIN OF gts_data_names,
        key_names                   TYPE gts_variable_names,

        create_data_names           TYPE gts_variable_names,
        read_data_names             TYPE gts_variable_names,
        change_data_names           TYPE gts_variable_names,

        return_struct_names         TYPE gts_variable_names,
        return_table_names          TYPE gts_variable_names,

        create_instance_method_name TYPE string,
        get_instance_method_name    TYPE string,

        get_data_method_name        TYPE string,
        update_data_method_name     TYPE string,

      END OF gts_data_names.

    DATA:
      gs_parameters        TYPE gts_parameters,
      gs_class_data        TYPE zab_abap_class_code_bo=>gts_data,
      gs_class_interf_data TYPE zab_abap_class_code_bo=>gts_data,
      gs_data_names        TYPE gts_data_names,

      gs_references        TYPE gts_references,

      gr_abap_class        TYPE REF TO zab_abap_class_code_bo,
      gr_abap_class_interf TYPE REF TO zab_abap_class_interf_code_bo,
      gr_abap_program      TYPE REF TO zab_abap_program_code_bo,
      gr_test_class_bo     TYPE REF TO zab_abap_class_code_bo,
      gr_test_execute_code TYPE REF TO zab_abap_code_bo.



    METHODS set_required_field_settings
      CHANGING ct_field_settings TYPE gtt_field_settings.

    METHODS:
      _validate_object_name
        CHANGING cr_return TYPE REF TO zab_return_exc,
      _validate_db_main_table
        CHANGING cr_return TYPE REF TO zab_return_exc,
      _validate_naming_name
        CHANGING cr_return TYPE REF TO zab_return_exc.

    METHODS:
      set_names
        RAISING zab_return_exc,

      create_class_and_interface,

      create_key
        RAISING zab_return_exc,
      create_key_type
        RAISING zab_return_exc,
      create_key_data
        RAISING zab_return_exc,
      create_key_get_method
        RAISING zab_return_exc,
      create_get_instance_method
        RAISING zab_return_exc,
      create_check_existance
        RAISING zab_return_exc,

      get_bapi_key_fields
        RETURNING VALUE(rt_key_fields_list) TYPE zab_abap_bapi_bo=>gtt_key_field_list
        RAISING   zab_return_exc.

    TYPES:
      BEGIN OF gts_bo_key_field,

        name                TYPE string,
*        data_type           TYPE string,
        db_table_name       TYPE tabname16,
        db_table_field_name TYPE name_feld,
        data_element_name   TYPE rollname,

      END OF gts_bo_key_field,
      gtt_bo_key_field_list TYPE STANDARD TABLE OF gts_bo_key_field WITH EMPTY KEY.

    DATA gt_bo_key_fields TYPE gtt_bo_key_field_list.

    METHODS:
      get_db_table_key_fields
        RETURNING VALUE(rt_key_fields_list) TYPE gtt_bo_key_field_list
        RAISING   zab_return_exc.

    METHODS:
      get_bo_key_fields
        RETURNING VALUE(rt_key_fields_list) TYPE gtt_bo_key_field_list
        RAISING   zab_return_exc.

    METHODS:
      create_read_data
        RAISING zab_return_exc,
      create_read_data_10_data_type
        RAISING zab_return_exc,
      create_read_data_20_attribute
        RAISING zab_return_exc,
*      create_read_data_30_read_meth
*        RAISING zab_return_exc,
      create_read_data_40_get_meth
        RAISING zab_return_exc,
      create_read_data_50_clear
        RAISING zab_return_exc.

    METHODS:
      add_param_exporting
        IMPORTING is_function_module_data TYPE zab_abap_function_module_bo=>gts_data
        CHANGING  cr_code                 TYPE REF TO zab_abap_code_bo,
      create_return_variables
        IMPORTING ir_bapi_bo TYPE REF TO zab_abap_bapi_bo
        CHANGING  cr_code    TYPE REF TO zab_abap_code_bo
        RAISING   zab_return_exc,

      create_new_object
        RAISING zab_return_exc,
      create_new_type
        RAISING zab_return_exc,
      create_new_method
        RAISING zab_return_exc,

      create_update_object
        RAISING zab_return_exc,
      create_update_type
        IMPORTING iv_data_type_name TYPE typename
                  ir_bapi           TYPE REF TO zab_abap_bapi_bo
        RAISING   zab_return_exc,
      create_update_method
        IMPORTING iv_structure_name   TYPE zab_abap_code_bo=>gtv_variable_name
                  iv_structure_name_2 TYPE string
                  iv_variable_name    TYPE zab_abap_code_bo=>gtv_variable_name
                  iv_clear_data_ind   TYPE abap_bool
                  ir_bapi             TYPE REF TO zab_abap_bapi_bo
                  iv_method_name      TYPE string
                  iv_data_type_name   TYPE string
        RAISING   zab_return_exc,

      create_non_crud_method
        RAISING zab_return_exc,

      convert_to_struct_field_name
        IMPORTING iv_name        TYPE name_feld
        RETURNING VALUE(rv_name) TYPE name_feld,

      add_decl_parameter_type
        IMPORTING
                  iv_paramtype  TYPE zab_abap_function_module_bo=>gtv_parameter_type
                  it_parameters TYPE zab_abap_function_module_bo=>gtt_parameters_data
        CHANGING
                  ct_type_list  TYPE zab_abap_type_code_bo=>gtt_type_list
                  cv_id         TYPE  zab_abap_type_code_bo=>gtv_id
        RAISING   zab_return_exc,

      add_raise_exception
        IMPORTING ir_bapi_bo TYPE REF TO zab_abap_bapi_bo
        CHANGING  cr_code    TYPE REF TO zab_abap_code_bo
        RAISING   zab_return_exc,

      get_bapi_parameters
        IMPORTING
                  it_parameters        TYPE zab_abap_function_module_bo=>gtt_parameters_data
                  iv_parameter_type    TYPE rs38l_kind
        RETURNING VALUE(rt_parameters) TYPE zab_abap_function_module_bo=>gtt_parameters_data,
      add_bapi_call_parameters
        IMPORTING
                  ir_bapi_bo              TYPE REF TO zab_abap_bapi_bo
                  iv_param_type_statement TYPE string
                  ir_code                 TYPE REF TO zab_abap_code_bo
                  it_parameters           TYPE zab_abap_function_module_bo=>gtt_parameters_data
                  iv_parameter_type       TYPE rs38l_kind
                  iv_struct_variable      TYPE rs38l_par_
                  iv_assign_bo_key_ind    TYPE abap_bool DEFAULT abap_true
        RAISING   zab_return_exc,

      test_prog_main
        RAISING zab_return_exc,
      test_prog_add_instance_call
        IMPORTING iv_variable_name TYPE string
        CHANGING  cr_code          TYPE REF TO zab_abap_code_bo
        RAISING   zab_return_exc,
      test_prog_get_instance_call
        RAISING zab_return_exc,
      test_prog_get_data_call
        RAISING zab_return_exc,
      test_prog_create_object_call
        RAISING zab_return_exc,
      test_prog_update_object_call
        RAISING zab_return_exc,
      test_prog_update_gen_call
        IMPORTING iv_method_name     TYPE string
                  iv_data_type_name  TYPE string
                  ir_bapi            TYPE REF TO zab_abap_bapi_bo
                  iv_out_comment_ind TYPE abap_bool
                  iv_variable_name   TYPE zab_abap_code_bo=>gtv_variable_name
        RAISING   zab_return_exc,
      test_prog_non_cru_object_call
        RAISING zab_return_exc,

      test_add_parameters
        IMPORTING
                  iv_name             TYPE fupararef-parameter
                  ir_abap_typedescr   TYPE REF TO cl_abap_typedescr
                  iv_deep_level       TYPE i
                  iv_indent_level     TYPE i
                  iv_out_comment_ind  TYPE abap_bool
                  iv_tables_param_ind TYPE abap_bool
        CHANGING  cr_code             TYPE REF TO zab_abap_code_bo
        RAISING   zab_return_exc,

      test_add_method_call_fields
        IMPORTING iv_name            TYPE fupararef-parameter
                  ir_abap_typedescr  TYPE REF TO cl_abap_typedescr
                  iv_space           TYPE string
                  iv_out_comment_ind TYPE abap_bool
        CHANGING  cr_code            TYPE REF TO zab_abap_code_bo
        RAISING   zab_return_exc,

      test_get_value
        IMPORTING iv_name              TYPE string
                  ir_abap_elemdescr    TYPE REF TO cl_abap_elemdescr
        RETURNING VALUE(rv_value_text) TYPE string
        RAISING   zab_return_exc,

      add_local_class_lines
        IMPORTING iv_class_name TYPE seoclsname
                  ir_code       TYPE REF TO zab_abap_code_bo
        RAISING   zab_return_exc,

      get_key_dummy_value
        IMPORTING iv_data_element TYPE string
        RETURNING VALUE(rv_text)  TYPE string
        RAISING   zab_return_exc,

      get_first_char
        IMPORTING iv_out_comment_ind   TYPE abap_bool
        RETURNING VALUE(rv_first_char) TYPE string,

      get_spaces
        IMPORTING iv_level              TYPE i
        RETURNING VALUE(lv_spaces_text) TYPE string,

      get_bapi_key_field_by_bo_key
        IMPORTING is_bo_key_field          TYPE gts_bo_key_field
                  it_bapi_key_fields       TYPE zab_abap_bapi_bo=>gtt_key_field_list
        RETURNING VALUE(rs_bapi_key_field) TYPE zab_abap_bapi_bo=>gts_key_field,

      get_abap_object_name
        IMPORTING iv_bo_object_name          TYPE zab_abap_class_code_bo=>gtv_bo_object_name
        RETURNING VALUE(rv_abap_object_name) TYPE string.

ENDCLASS.

CLASS zbo_abap_bapi_cls_gen_prc IMPLEMENTATION.

  METHOD create.

    rr_instance = NEW #( ).

    rr_instance->gs_parameters = is_parameters.

  ENDMETHOD.

  METHOD get_corrected_parameters.

    DATA(ls_old_parameters) = gs_parameters.

    gs_parameters = is_new_parameters.

    gs_parameters-class-message_class_name =
      |Z{ gs_parameters-class-module_abbrev }_| &&
      gs_parameters-class-abap_object_name.

    "*******************************************************************************
    "BAPI names
    "*******************************************************************************

    IF ls_old_parameters-bapis-create_bapi         IS INITIAL AND
       ls_old_parameters-bapis-read_bapi           IS INITIAL AND
       ls_old_parameters-bapis-update_bapi         IS INITIAL AND
       ls_old_parameters-bapis-non_cru_bapis_rng[] IS INITIAL AND
       ( is_new_parameters-bapis-create_bapi         IS NOT INITIAL OR
         is_new_parameters-bapis-update_bapi         IS NOT INITIAL OR
         is_new_parameters-bapis-read_bapi           IS NOT INITIAL OR
         is_new_parameters-bapis-non_cru_bapis_rng[] IS NOT INITIAL ).

      gs_parameters-class-key_ind = abap_true.
      gs_parameters-test_program-instantiate_call_ind = abap_true.

    ENDIF.

    "Object key and instantiate
    IF gs_parameters-bapis-create_bapi IS INITIAL AND
       gs_parameters-bapis-update_bapi IS INITIAL AND
       gs_parameters-bapis-read_bapi   IS INITIAL AND
       gs_parameters-bapis-non_cru_bapis_rng[] IS INITIAL.

      gs_parameters-class-key_ind = ''.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'CLASS-KEY_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

      gs_parameters-test_program-instantiate_call_ind = ''.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'TEST_PROGRAM-INSTANTIATE_CALL_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

    ENDIF.

    "*******************************************************************************
    "Business Object class
    "*******************************************************************************

    IF gs_parameters-class-abap_object_name IS INITIAL.

      gs_parameters-class-abap_object_name = get_abap_object_name( gs_parameters-class-bo_object_name ).

    ENDIF.

    "Create
    IF ls_old_parameters-bapis-create_bapi <> is_new_parameters-bapis-create_bapi.

      IF is_new_parameters-bapis-create_bapi IS NOT INITIAL.

        gs_parameters-class-create_ind = 'X'.
        gs_parameters-test_program-create_object_call_ind = 'X'.
        gs_parameters-test_program-create_data_out_comment_ind = 'X'.

      ENDIF.

    ENDIF.

    IF gs_parameters-bapis-create_bapi IS INITIAL.

      gs_parameters-class-create_ind = abap_false.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'CLASS-CREATE_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

      gs_parameters-test_program-create_object_call_ind = abap_false.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'TEST_PROGRAM-CREATE_OBJECT_CALL_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

    ENDIF.

    IF gs_parameters-test_program-create_object_call_ind = abap_false.

      gs_parameters-test_program-create_data_out_comment_ind = abap_false.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'TEST_PROGRAM-CREATE_DATA_OUT_COMMENT_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

    ENDIF.

    "Read
    IF ls_old_parameters-bapis-read_bapi <> is_new_parameters-bapis-read_bapi.

      IF is_new_parameters-bapis-read_bapi IS NOT INITIAL.

        gs_parameters-class-read_ind = 'X'.
        gs_parameters-test_program-read_call_ind = 'X'.

      ENDIF.

    ENDIF.

    IF gs_parameters-bapis-read_bapi IS INITIAL.

      gs_parameters-class-read_ind = ''.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'CLASS-READ_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

      gs_parameters-test_program-read_call_ind = ''.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'TEST_PROGRAM-READ_CALL_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

    ENDIF.

    "Update
    IF ls_old_parameters-bapis-update_bapi <> is_new_parameters-bapis-update_bapi.

      IF is_new_parameters-bapis-update_bapi IS NOT INITIAL.

        gs_parameters-class-update_ind = 'X'.
        gs_parameters-test_program-update_object_call_ind = 'X'.
        gs_parameters-test_program-update_out_comment_ind = 'X'.

      ENDIF.

    ENDIF.

    IF gs_parameters-bapis-update_bapi IS INITIAL.

      gs_parameters-class-update_ind = ''.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'CLASS-UPDATE_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

      gs_parameters-test_program-update_object_call_ind = ''.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'TEST_PROGRAM-UPDATE_OBJECT_CALL_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

    ENDIF.

    IF gs_parameters-test_program-update_object_call_ind = ''.

      gs_parameters-test_program-update_out_comment_ind = ''.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'TEST_PROGRAM-UPDATE_OUT_COMMENT_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

    ENDIF.

    "Non-CRU BAPI
    IF ls_old_parameters-bapis-non_cru_bapis_rng[] <> is_new_parameters-bapis-non_cru_bapis_rng[].

      IF is_new_parameters-bapis-non_cru_bapis_rng[] IS NOT INITIAL.

        gs_parameters-class-non_cru_ind = 'X'.
        gs_parameters-test_program-non_cru_ind = 'X'.

      ENDIF.

    ENDIF.

    IF gs_parameters-bapis-non_cru_bapis_rng[] IS INITIAL.

      gs_parameters-class-non_cru_ind = ''.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'CLASS-NON_CRU_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

      gs_parameters-test_program-non_cru_ind = ''.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'TEST_PROGRAM-NON_CRU_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

    ENDIF.

    IF gs_parameters-test_program-create_ind = abap_false.

*      gs_parameters-test_program-instantiate_call_ind = ''.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'TEST_PROGRAM-INSTANTIATE_CALL_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

*      gs_parameters-test_program-create_object_call_ind = ''.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'TEST_PROGRAM-CREATE_OBJECT_CALL_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

*      gs_parameters-test_program-create_data_out_comment_ind = ''.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'TEST_PROGRAM-CREATE_DATA_OUT_COMMENT_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

*      gs_parameters-test_program-read_call_ind = ''.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'TEST_PROGRAM-READ_CALL_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

*      gs_parameters-test_program-update_object_call_ind = ''.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'TEST_PROGRAM-UPDATE_OBJECT_CALL_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

      set_field_attr(
        EXPORTING
          iv_field_path_name = 'TEST_PROGRAM-UPDATE_OUT_COMMENT_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).


*      gs_parameters-test_program-text_bo_ind = ''.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'TEST_PROGRAM-TEXT_BO_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

*      gs_parameters-test_program-abap_struct_descr_ind = ''.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'TEST_PROGRAM-ABAP_STRUCT_DESCR_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

*      gs_parameters-test_program-deep_struct_vw_ind = ''.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'TEST_PROGRAM-DEEP_STRUCT_VW_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

*      gs_parameters-test_program-alv_tree_vw_ind = ''.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'TEST_PROGRAM-ALV_TREE_VW_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

*      gs_parameters-bo_frame_work-excep_class_view_ind = ''.
      set_field_attr(
        EXPORTING
          iv_field_path_name = 'BO_FRAME_WORK-EXCEP_CLASS_VIEW_IND'
          iv_disabled_ind = abap_true
        CHANGING
          ct_field_settings = rs_return-field_settings ).

    ENDIF.

    "Set required fields
    set_required_field_settings(
      CHANGING ct_field_settings = rs_return-field_settings ).

    rs_return-parameters = gs_parameters.

  ENDMETHOD.

  METHOD set_required_field_settings.

    set_field_attr(
      EXPORTING
        iv_field_path_name = 'CLASS-MODULE_ABBREV'
        iv_required_ind = abap_true
      CHANGING
        ct_field_settings = ct_field_settings ).

    set_field_attr(
      EXPORTING
        iv_field_path_name = 'CLASS-BO_OBJECT_NAME'
        iv_required_ind = abap_true
      CHANGING
        ct_field_settings = ct_field_settings ).

    set_field_attr(
      EXPORTING
        iv_field_path_name = 'CLASS-ABAP_OBJECT_NAME'
        iv_required_ind = abap_true
      CHANGING
        ct_field_settings = ct_field_settings ).

    set_field_attr(
      EXPORTING
        iv_field_path_name = 'NAMING-NAMING_NAME'
        iv_required_ind = abap_true
      CHANGING
        ct_field_settings = ct_field_settings ).

  ENDMETHOD.

  METHOD validate.

    DATA lr_return TYPE REF TO zab_return_exc.

    lr_return = zab_return_exc=>create_empty( ).

    "BAPIs
    IF gs_parameters-bapis-create_bapi IS INITIAL AND
       gs_parameters-bapis-read_bapi IS INITIAL AND
       gs_parameters-bapis-update_bapi IS INITIAL AND
       gs_parameters-bapis-non_cru_bapis_rng[] IS INITIAL.

      lr_return->add_by_text(
        iv_message    = 'Fill at least one BAPI.'
        iv_field_name = 'BAPIS-CREATE_BAPI' ).

    ENDIF.

    "Module name abbreviation
    IF gs_parameters-class-module_abbrev IS INITIAL.

      lr_return->add_by_text(
        iv_message    = 'Module name abbreviation is not filled.'
        iv_field_name = 'CLASS-MODULE_ABBREV' ).

    ENDIF.

    "Business object name
    IF gs_parameters-class-bo_object_name IS INITIAL.

      lr_return->add_by_text(
        iv_message    = 'Business object name is not filled.'
        iv_field_name = 'CLASS-BO_OBJECT_NAME' ).

    ENDIF.

    "Validate object name
    _validate_object_name(
      CHANGING cr_return = lr_return ).

    "Validate DB main table
    _validate_db_main_table(
      CHANGING cr_return = lr_return ).

    IF gs_parameters-class-message_class_name IS INITIAL.

      lr_return->add_by_text(
        iv_message    = 'Message class name is not filled.'
        iv_field_name = 'CLASS-MESSAGE_CLASS_NAME' ).

    ENDIF.

    "Validate naming name
    _validate_naming_name(
      CHANGING cr_return = lr_return ).

    rs_validate-return_tab = lr_return->get_bapiret2_table( ).

  ENDMETHOD.



  METHOD _validate_object_name.

    DATA lv_text TYPE string.

    IF gs_parameters-class-abap_object_name IS INITIAL.

      cr_return->add_by_text(
        iv_message    = 'ABAP object name is not filled.'
        iv_field_name = 'CLASS-ABAP_OBJECT_NAME' ).

    ENDIF.

    lv_text = gs_parameters-class-abap_object_name.

    IF lv_text CN '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ_'.

      DATA(lv_char) = substring( val = lv_text off = sy-fdpos len = 1 ).

      cr_return->add_by_text(
        iv_message    = 'ABAP object name contains not allowed characters. Character: &1. Position &2. Waarde &3.'
        iv_field_name = 'CLASS-ABAP_OBJECT_NAME'
        iv_variable_1 = CONV #( lv_char )
        iv_variable_2 = CONV #( CONV string( sy-fdpos + 1 ) )
        iv_variable_3 = CONV #( gs_parameters-class-abap_object_name ) ).

    ENDIF.

  ENDMETHOD.

  METHOD _validate_db_main_table.

    IF gs_parameters-class-main_db_table_name IS INITIAL.

      RETURN.

    ENDIF.

    SELECT SINGLE 'X' AS exist_ind
    FROM dd02l
    INTO @DATA(lv_exist_ind)
    WHERE
      tabname  = @gs_parameters-class-main_db_table_name AND
      tabclass = 'TRANSP'.

    IF sy-subrc <> 0.

      cr_return->add_by_text(
        iv_message    = 'DB table &1 does not exist.'
        iv_field_name = 'CLASS-MAIN_DB_TABLE_NAME'
        iv_variable_1 = CONV #( gs_parameters-class-main_db_table_name ) ).

    ENDIF.

  ENDMETHOD.

  METHOD _validate_naming_name.

    IF gs_parameters-naming-naming_name IS INITIAL.

      cr_return->add_by_text(
        iv_message    = 'ABAP Naming name is not filled.'
        iv_field_name = 'NAMING-NAMING_NAME'
        iv_variable_1 = CONV #( gs_parameters-class-main_db_table_name ) ).

    ENDIF.

  ENDMETHOD.

  METHOD start.

    DATA lr_root_code TYPE REF TO zab_abap_code_bo.

    "******************************************************************
    "Validate
    "******************************************************************
    DATA(ls_validate) = validate( ).

    DATA(lx_return) = zab_return_exc=>create_by_bapiret2_table( ls_validate-return_tab ).

    IF lx_return IS NOT INITIAL.

      RAISE EXCEPTION lx_return.

    ENDIF.

    "******************************************************************
    "Set naming convention
    "******************************************************************
    zab_abap_naming_bo=>set_naming_name( gs_parameters-naming-naming_name ).

    "Instantiate BAPI objects
    IF gs_parameters-bapis-read_bapi IS NOT INITIAL.

      gs_references-read_bapi =
        zab_abap_bapi_bo=>get_bapi_by_name(
          iv_bapi_name            = gs_parameters-bapis-read_bapi
          iv_db_table_name        = gs_parameters-class-main_db_table_name
          iv_bor_object_type_name = gs_parameters-class-bor_object_type_name
          iv_action_type_name     = zab_abap_bapi_bo=>gcc_read_action_type_name ).

    ENDIF.

    IF gs_parameters-bapis-create_bapi IS NOT INITIAL.

      gs_references-create_bapi =
        zab_abap_bapi_bo=>get_bapi_by_name(
          iv_bapi_name             = gs_parameters-bapis-create_bapi
          iv_db_table_name         = gs_parameters-class-main_db_table_name
          iv_bor_object_type_name  = gs_parameters-class-bor_object_type_name
          iv_action_type_name      = zab_abap_bapi_bo=>gcc_create_action_type_name ).

    ENDIF.

    IF gs_parameters-bapis-update_bapi IS NOT INITIAL.

      gs_references-update_bapi =
        zab_abap_bapi_bo=>get_bapi_by_name(
          iv_bapi_name             = gs_parameters-bapis-update_bapi
          iv_db_table_name         = gs_parameters-class-main_db_table_name
          iv_bor_object_type_name  = gs_parameters-class-bor_object_type_name
          iv_action_type_name      = zab_abap_bapi_bo=>gcc_update_action_type_name ).

    ENDIF.

    "Set names
    set_names( ).

    "******************************************************************
    "Create class and interface
    "******************************************************************
    create_class_and_interface( ).

    "******************************************************************
    "Create the code
    "******************************************************************
    IF gs_parameters-class-key_ind = abap_true.

      create_key( ).

    ENDIF.

    IF gs_parameters-class-create_ind = abap_true AND
       gs_parameters-bapis-create_bapi IS NOT INITIAL.

      create_new_object( ).

    ENDIF.

    IF gs_parameters-class-key_ind = abap_true.

      create_get_instance_method( ).

      create_check_existance( ).

    ENDIF.

    IF gs_parameters-class-read_ind = abap_true AND
       gs_parameters-bapis-read_bapi IS NOT INITIAL.

      create_read_data( ).

    ENDIF.


    IF gs_parameters-class-update_ind = abap_true AND
       gs_parameters-bapis-update_bapi IS NOT INITIAL.

      create_update_object( ).

    ENDIF.

    IF gs_parameters-class-non_cru_ind = abap_true AND
       gs_parameters-bapis-non_cru_bapis_rng[] IS NOT INITIAL.

      create_non_crud_method( ).

    ENDIF.

    "Create Report
    gr_abap_program =
      zab_abap_program_code_bo=>create_new(
        VALUE #(
          name = |Z| && to_upper( gs_parameters-class-module_abbrev ) && |_| &&
          to_upper( gs_parameters-class-abap_object_name ) && |_P|
        ) ).

    lr_root_code = gr_abap_program.

    "Add exception class
    IF gs_parameters-bo_frame_work-exception_class_ind = abap_true.

      add_local_class_lines(
        iv_class_name = 'ZAB_RETURN_EXC'
        ir_code       = gr_abap_program ).

    ENDIF.

    IF gs_parameters-test_program-db_transaction_ind = abap_true.

      add_local_class_lines(
        iv_class_name = 'ZDB_TRANSACTION_DLO'
        ir_code       = gr_abap_program ).

    ENDIF.

    "Add BO interface class
    IF gs_parameters-class-interface_ind = abap_true.

      gr_abap_program->add_abap_class( gr_abap_class_interf ).

    ENDIF.

    "Add BO class
    gr_abap_program->add_abap_class( gr_abap_class ).

    "If create test program
    IF gs_parameters-test_program-create_ind = abap_true.

      IF gs_parameters-bo_frame_work-excep_class_view_ind = abap_true.

        add_local_class_lines(
          iv_class_name = 'ZAB_RETURN_EXC_VW'
          ir_code       = gr_abap_program ).

      ENDIF.

      IF gs_parameters-test_program-text_bo_ind = abap_true.

        add_local_class_lines(
          iv_class_name = 'ZAB_ABAP_TEXT_BO'
          ir_code       = gr_abap_program ).

      ENDIF.

      IF gs_parameters-test_program-abap_struct_descr_ind = abap_true.

        add_local_class_lines(
          iv_class_name = 'ZAB_ABAP_STRUCT_DESCR'
          ir_code       = gr_abap_program ).

      ENDIF.

      IF gs_parameters-test_program-deep_struct_vw_ind = abap_true.

        add_local_class_lines(
          iv_class_name = 'ZAB_DEEP_TO_FLAT_DATA_CONVERT'
          ir_code       = gr_abap_program ).

      ENDIF.

      IF gs_parameters-test_program-alv_tree_vw_ind = abap_true.

        add_local_class_lines(
          iv_class_name = 'ZUI_ALV_TREE_VW'
          ir_code       = gr_abap_program ).

      ENDIF.

      "Add test code
      test_prog_main( ).

    ENDIF.

    rv_code =
      lr_root_code->get_code(
        iv_code_level = 1 ).

  ENDMETHOD.

  METHOD create_key.

    create_key_type( ).

    create_key_data( ).

    create_key_get_method( ).

  ENDMETHOD.

  METHOD create_key_type.

    DATA(lt_key_fields) = me->get_bo_key_fields( ).

    DATA lt_type_list TYPE zab_abap_type_code_bo=>gtt_type_list.

    DATA lv_id TYPE zab_abap_type_code_bo=>gtv_id.

    lv_id = 1.

    DATA(lv_key_field_count) = lines( lt_key_fields ).

    IF lv_key_field_count = 0.

      APPEND INITIAL LINE TO lt_type_list
        ASSIGNING FIELD-SYMBOL(<ls_type>).

      <ls_type>-id        = lv_id.
      <ls_type>-parent_id = 0.
      <ls_type>-name      = gs_data_names-key_names-data_type_name.
      <ls_type>-kind      = zab_abap_type_code_bo=>gcc_kind_structure..

      lv_id = lv_id + 1.

      APPEND INITIAL LINE TO lt_type_list
        ASSIGNING <ls_type>.

      <ls_type>-id           = lv_id.
      <ls_type>-parent_id    = 1.
      <ls_type>-name         = 'NO_KEY_FIELDS'.
      <ls_type>-kind         = zab_abap_type_code_bo=>gcc_kind_value.
      <ls_type>-data_type    = 'CHAR1'.

      IF me->gs_parameters-class-bor_object_type_name IS NOT INITIAL AND
         me->gs_parameters-class-main_db_table_name IS NOT INITIAL.

        <ls_type>-comment_text =
          |TODO: No key fields found in | &&
          |BOR object type {  me->gs_parameters-class-bor_object_type_name } or | &&
          |DB table { me->gs_parameters-class-main_db_table_name }.|.

      ELSEIF me->gs_parameters-class-bor_object_type_name IS NOT INITIAL.

        <ls_type>-comment_text =
          |TODO: No key fields found in | &&
          |BOR object type {  me->gs_parameters-class-bor_object_type_name }.|.

      ELSEIF me->gs_parameters-class-main_db_table_name IS NOT INITIAL.

        <ls_type>-comment_text =
          |TODO: No key fields found in | &&
          |DB table { me->gs_parameters-class-main_db_table_name }.|.

      ELSE.

        <ls_type>-comment_text =
          |TODO: No key fields found in, because no BOR object type or DB table was entered on the selection screen. |.

      ENDIF.

    ELSEIF lv_key_field_count = 1.

      ASSIGN lt_key_fields[ 1 ]
        TO FIELD-SYMBOL(<ls_key_field>).

      APPEND INITIAL LINE TO lt_type_list
        ASSIGNING <ls_type>.

      <ls_type>-id        = lv_id.
      <ls_type>-parent_id = 0.
      <ls_type>-name      = gs_data_names-key_names-data_type_name.
      <ls_type>-kind      = zab_abap_type_code_bo=>gcc_kind_value.
      <ls_type>-data_type = <ls_key_field>-data_element_name.

    ELSE.

      APPEND INITIAL LINE TO lt_type_list
        ASSIGNING <ls_type>.

      <ls_type>-id        = lv_id.
      <ls_type>-parent_id = 0.
      <ls_type>-name      = gs_data_names-key_names-data_type_name.
      <ls_type>-kind      = zab_abap_type_code_bo=>gcc_kind_structure.

      LOOP AT lt_key_fields
        ASSIGNING <ls_key_field>.

        lv_id = lv_id + 1.

        APPEND INITIAL LINE TO lt_type_list
          ASSIGNING <ls_type>.

        <ls_type>-id        = lv_id.
        <ls_type>-parent_id = 1.
        <ls_type>-name      = <ls_key_field>-name.
        <ls_type>-kind      = zab_abap_type_code_bo=>gcc_kind_value.
        <ls_type>-data_type = <ls_key_field>-data_element_name.

      ENDLOOP.

    ENDIF.

    "Add key structure
    IF me->gs_parameters-class-interface_ind = abap_false.

      gr_abap_class->add_type_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        it_type_list = lt_type_list ).

    ELSE.

      gr_abap_class_interf->add_type_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        it_type_list = lt_type_list ).

      gr_abap_class->add_alias(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        it_aliases  =  VALUE #(
          ( alias_name     = lt_type_list[ 1 ]-name
            component_name = |{ to_lower( gs_class_interf_data-class_name ) }~{ lt_type_list[ 1 ]-name }| ) )
        ).

    ENDIF.

  ENDMETHOD.

  METHOD create_key_data.

    DATA(lt_key_fields) = me->get_bo_key_fields( ).

    IF lines( lt_key_fields ) = 1.

      gr_abap_class->add_data_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_protected
        it_data_list = VALUE #(
          (
            id         = 1
            parent_id  = 0
            name      = gs_data_names-key_names-variable_name
            kind      = zab_abap_type_code_bo=>gcc_kind_value
            data_type = gs_data_names-key_names-data_type_name ) ) ).

    ELSE.

      gr_abap_class->add_data_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_protected
        it_data_list = VALUE #(
          (
            id         = 1
            parent_id  = 0
            name      = gs_data_names-key_names-variable_name
            kind      = zab_abap_type_code_bo=>gcc_kind_value
            data_type = gs_data_names-key_names-data_type_name ) ) ).

    ENDIF.

  ENDMETHOD.

  METHOD create_key_get_method.

    DATA(lr_code) = NEW zab_abap_code_bo( ).

    IF lines( me->gt_bo_key_fields ) = 1.

      DATA(lv_variable_kind) = zab_abap_variable_name_bo=>gcc_kind_value.

    ELSE.

      lv_variable_kind = zab_abap_variable_name_bo=>gcc_kind_structure.

    ENDIF.

    DATA(lv_return_key_name) =
      zab_abap_variable_name_bo=>create_by_data( VALUE #(
        name            = 'KEY'
        life_time       = zab_abap_variable_name_bo=>gcc_returning_param_life_time
        variable_kind   = lv_variable_kind
        changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
      ) )->get_variable_name( ).

    lr_code->add_code_line( || ).
    lr_code->add_code_line( |    { to_lower( lv_return_key_name ) } = { to_lower( me->gs_data_names-key_names-variable_name ) }.| ).
*      lr_code->add_code_line( || ).

    "**************************************************************************
    "Add method
    "**************************************************************************

    .

    DATA(lt_code_list) =
      lr_code->get_code_lines(
        iv_code_level = 2 ).

    DATA(ls_method) =
      VALUE zab_abap_method_code_bo=>gts_data(
        type = zab_abap_method_code_bo=>gcc_instance_method_type
        name = 'GET_KEY'
        parameters = VALUE #(
          (
            type        = zab_abap_method_code_bo=>gcc_returning_param_type
            name        = lv_return_key_name
            typing_code = zab_abap_method_code_bo=>gcc_type_typing_code
            data_type   = gs_data_names-key_names-data_type_name
          )
        )
        code_list = lt_code_list
      ).

    IF me->gs_parameters-class-interface_ind = abap_false.

      gr_abap_class->add_method_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        is_method  = ls_method ).

    ELSE.

      lt_code_list =
        lr_code->get_code_lines(
          iv_code_level = 1 ).

      gr_abap_class_interf->add_method_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        is_method  = ls_method ).

      ls_method-alias_component_name = |{ me->gs_class_interf_data-class_name }~{ ls_method-name }|.

      gr_abap_class->add_method_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        is_method  = ls_method ).

    ENDIF.
  ENDMETHOD.

  METHOD create_get_instance_method.

    DATA(lt_key_fields) = me->get_bo_key_fields( ).

    DATA(lv_return_ref_var_name) =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = gs_class_data-variable_name
          life_time       = zab_abap_variable_name_bo=>gcc_returning_param_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_ref
          changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
        ) )->get_variable_name( ).

    DATA(lv_local_ref_var_name) =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = gs_class_data-variable_name
          life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_ref
          changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
        ) )->get_variable_name( ).

    IF lines( lt_key_fields ) = 1.

      DATA(lv_key_parameter_name)  =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = 'KEY'
          life_time       = zab_abap_variable_name_bo=>gcc_importing_param_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_value
          changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
        ) )->get_variable_name( ).

      DATA(lv_object_key_name) =  me->gs_data_names-key_names-variable_name.

      DATA(lv_key_data_type) = me->gs_data_names-key_names-data_type_name.

    ELSE.

      lv_key_parameter_name  =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = 'KEY'
          life_time       = zab_abap_variable_name_bo=>gcc_importing_param_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_structure
          changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
        ) )->get_variable_name( ).

      lv_object_key_name = me->gs_data_names-key_names-variable_name.

      lv_key_data_type = me->gs_data_names-key_names-data_type_name.

    ENDIF.

    "Code list
    IF me->gs_parameters-class-interface_ind = abap_false.

      DATA(lt_code_list) =
        VALUE zab_abap_method_code_bo=>gtt_lines(
          ( || )
          ( |    { lv_return_ref_var_name } = NEW #( ).| )
          ( || )
          ( |    { lv_return_ref_var_name }->{ lv_object_key_name } = { lv_key_parameter_name }.| )
          ( || )
          ( |    { lv_return_ref_var_name }->check_existance( ).| )
        ).

    ELSE.

      lt_code_list =
        VALUE zab_abap_method_code_bo=>gtt_lines(
          ( || )
          ( |    DATA({ lv_local_ref_var_name }) = NEW { to_lower( me->gs_class_data-class_name ) }( ).| )
          ( || )
          ( |    { lv_local_ref_var_name }->{ lv_object_key_name } = { lv_key_parameter_name }.| )
          ( || )
          ( |    { lv_local_ref_var_name }->check_existance( ).| )
          ( || )
          ( |    { lv_return_ref_var_name } = { lv_local_ref_var_name }.| )
        ).

    ENDIF.


    "Map method data
    DATA(ls_method) =
      VALUE zab_abap_method_code_bo=>gts_data(
        type = zab_abap_method_code_bo=>gcc_class_method_type
        name = me->gs_data_names-get_instance_method_name
        parameters = VALUE #(
          (
            type = zab_abap_method_code_bo=>gcc_importing_param_type
            name = lv_key_parameter_name
            typing_code = zab_abap_method_code_bo=>gcc_type_typing_code
            data_type = lv_key_data_type
          )
          (
            type = zab_abap_method_code_bo=>gcc_returning_param_type
            name      = lv_return_ref_var_name
            typing_code = zab_abap_method_code_bo=>gcc_type_ref_to_typing_code
            data_type   = to_lower( me->gs_class_data-class_name )
          )
          (
            type      = zab_abap_method_code_bo=>gcc_exception_type
            name      = |zab_return_exc|
          )
        )
        code_list = lt_code_list
      ).


    IF me->gs_parameters-class-interface_ind = abap_false.

      "Add method.
      gr_abap_class->add_method_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        is_method  = ls_method ).

    ELSE.

      ls_method-parameters[ 2 ]-data_type = me->gs_class_interf_data-class_name.

      gr_abap_class_interf->add_method_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        is_method  = ls_method ).

      ls_method-alias_component_name = |{ me->gs_class_interf_data-class_name }~{ ls_method-name }|.

      gr_abap_class->add_method_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        is_method  = ls_method ).

    ENDIF.

  ENDMETHOD.

  METHOD get_bapi_key_fields.

    IF me->gs_references-read_bapi IS NOT INITIAL.

      DATA(lr_bapi_bo) = me->gs_references-read_bapi.

    ELSEIF me->gs_references-update_bapi IS NOT INITIAL.

      lr_bapi_bo = me->gs_references-update_bapi.

    ELSEIF me->gs_references-create_bapi IS NOT INITIAL.

      lr_bapi_bo = me->gs_references-create_bapi.

    ELSEIF me->gs_parameters-bapis-non_cru_bapis_rng[] IS NOT INITIAL.

      READ TABLE gs_parameters-bapis-non_cru_bapis_rng
        INDEX 1
        ASSIGNING FIELD-SYMBOL(<ls_bapi_rng>).

      DATA(lv_bapi_name) = <ls_bapi_rng>-low.

      lr_bapi_bo = zab_abap_bapi_bo=>get_bapi_by_name(
        iv_bapi_name             = lv_bapi_name
        iv_db_table_name         = gs_parameters-class-main_db_table_name
        iv_bor_object_type_name  = gs_parameters-class-bor_object_type_name
        iv_action_type_name      = zab_abap_bapi_bo=>gcc_update_action_type_name ).

    ELSE.

      DATA(lx_return) = zab_return_exc=>create_by_text(
        iv_message    = 'No BAPI filled.' ).

      RAISE EXCEPTION lx_return.

    ENDIF.

    rt_key_fields_list = lr_bapi_bo->get_key_fields( ).

  ENDMETHOD.

  METHOD get_db_table_key_fields.

    DATA(lr_db_table_bo) = zab_ddic_db_table_bo=>get_by_name( me->gs_parameters-class-main_db_table_name ).

    DATA(lt_db_table_key_fields) = lr_db_table_bo->get_key_field_list( ).

    DATA(lt_bapi_key_fields) = get_bapi_key_fields( ).

    LOOP AT lt_db_table_key_fields
      ASSIGNING FIELD-SYMBOL(<ls_db_table_key_field>).

      APPEND INITIAL LINE TO rt_key_fields_list
        ASSIGNING FIELD-SYMBOL(<ls_bo_key_field>).

*      READ TABLE lt_bapi_key_fields
*        WITH KEY db_table_name        = me->gs_parameters-class-main_db_table_name
*                 db_table_field_name  = <ls_db_table_key_field>-fieldname
*        ASSIGNING FIELD-SYMBOL(<ls_bapi_key_field>).
*
*      DATA(lv_bapi_key_field) = sy-tabix.
*
*      "Fieldname of the BAPI is preferred
*      IF sy-subrc = 0.
*
*        IF <ls_bapi_key_field>-struc_field_name IS NOT INITIAL.
*
*          <ls_bo_key_field>-name = <ls_bapi_key_field>-struc_field_name.
*
*        ELSE.
*
*          <ls_bo_key_field>-name = <ls_bapi_key_field>-name.
*
*        ENDIF.
*
*        "To overcome fields get the same name
*        DELETE lt_bapi_key_fields
*          INDEX lv_bapi_key_field.
*
*      ELSE.

      <ls_bo_key_field>-name = <ls_db_table_key_field>-fieldname.

*      ENDIF.

      <ls_bo_key_field>-db_table_name       = me->gs_parameters-class-main_db_table_name.
      <ls_bo_key_field>-db_table_field_name = <ls_db_table_key_field>-fieldname.
      <ls_bo_key_field>-data_element_name   = <ls_db_table_key_field>-rollname.

    ENDLOOP.

  ENDMETHOD.

  METHOD get_bo_key_fields.

    IF gt_bo_key_fields[] IS NOT INITIAL.

      rt_key_fields_list[] = gt_bo_key_fields[].

      RETURN.

    ENDIF.

    "--------------------------------------------------------------------
    "Get key lists of BOR, DB table and Read bapi
    "--------------------------------------------------------------------

    "Get BOR key fields
    IF me->gs_parameters-class-bor_object_type_name IS NOT INITIAL.
      "Get BOR key fields
      DATA(lr_bor_object_type) =
        zab_bor_object_type_bo=>get_instance( me->gs_parameters-class-bor_object_type_name ).

      DATA(lt_bor_object_type_key_list) =
        lr_bor_object_type->get_key_field_list( ).

      DATA(lv_bor_key_field_count) = lines( lt_bor_object_type_key_list ).

    ENDIF.

    "Get DB table key fields
    IF me->gs_parameters-class-main_db_table_name IS NOT INITIAL.

      DATA(lr_db_table_bo) = zab_ddic_db_table_bo=>get_by_name( me->gs_parameters-class-main_db_table_name ).

      DATA(lt_db_table_key_fields) = lr_db_table_bo->get_key_field_list( ).

      DATA(lv_db_table_key_field_count) = lines( lt_db_table_key_fields ).

    ENDIF.

    "Get BAPI key fields
    DATA(lt_bapi_key_fields) = get_bapi_key_fields( ).

    "--------------------------------------------------------------------
    "Build BO key field list
    "--------------------------------------------------------------------

    IF me->gs_parameters-class-bor_object_type_name IS NOT INITIAL AND
      lv_bor_key_field_count >= lv_db_table_key_field_count.

      "BOR is leading: If key field count of BOR are equal or more than DB table

      LOOP AT lt_bor_object_type_key_list
        ASSIGNING FIELD-SYMBOL(<ls_bor_key_field>).

        APPEND INITIAL LINE TO gt_bo_key_fields
          ASSIGNING FIELD-SYMBOL(<ls_bo_key_field>).

        <ls_bo_key_field>-name                = <ls_bor_key_field>-verb.
        <ls_bo_key_field>-db_table_name       = <ls_bor_key_field>-refstruct.
        <ls_bo_key_field>-db_table_field_name = <ls_bor_key_field>-reffield.

        READ TABLE lt_bapi_key_fields
          WITH KEY
            db_table_name       = <ls_bo_key_field>-db_table_name
            db_table_field_name = <ls_bo_key_field>-db_table_field_name
          ASSIGNING FIELD-SYMBOL(<ls_bapi_key_field>).

        IF sy-subrc <> 0.

          <ls_bo_key_field>-data_element_name   = <ls_bor_key_field>-rollname.

        ELSE.

          <ls_bo_key_field>-data_element_name = <ls_bapi_key_field>-data_type.

        ENDIF.

      ENDLOOP.

    ELSEIF me->gs_parameters-class-main_db_table_name IS NOT INITIAL.
      "2. Key based on main DB table

      gt_bo_key_fields = get_db_table_key_fields( ).

    ELSE.

      "3. Key based on a BAPI
      LOOP AT lt_bapi_key_fields
        ASSIGNING <ls_bapi_key_field>.

        APPEND INITIAL LINE TO gt_bo_key_fields
          ASSIGNING <ls_bo_key_field>.

        <ls_bo_key_field>-name                = <ls_bapi_key_field>-name.
        <ls_bo_key_field>-db_table_name       = <ls_bapi_key_field>-db_table_name.
        <ls_bo_key_field>-db_table_field_name = <ls_bapi_key_field>-db_table_field_name.
        <ls_bo_key_field>-data_element_name   = <ls_bapi_key_field>-data_element_name.

      ENDLOOP.

    ENDIF.

    "Set key fields
    rt_key_fields_list[] = gt_bo_key_fields[].

  ENDMETHOD.

  METHOD create_check_existance.

    DATA(lt_key_fields) = me->get_bo_key_fields( ).

    IF me->gs_parameters-class-main_db_table_name IS NOT INITIAL.

      DATA(lr_struct_descr) =
        CAST cl_abap_structdescr(
          cl_abap_structdescr=>describe_by_name( me->gs_parameters-class-main_db_table_name ) ).

      DATA lt_code_list TYPE zab_abap_method_code_bo=>gts_data-code_list.

      "------------------------------------------------------------------------
      "Add SELECT statement
      "------------------------------------------------------------------------

      DATA(lv_exit_value_var_name) =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = 'EXIST_IND'
          life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_value
          changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
        ) )->get_variable_name( ).

      lt_code_list = VALUE #(
        ( || )
        ( |    SELECT SINGLE| )
        ( |        'X' AS exist_ind| )
        ( |      FROM { to_lower( me->gs_parameters-class-main_db_table_name ) }| )
        ( |      INTO @DATA({ lv_exit_value_var_name })| )
        ( |      WHERE| )
      ).

      "Add WHERE clause
      DATA(lt_ddic_field_list) = lr_struct_descr->get_ddic_field_list( ).

      DATA(lr_db_table_bo) = zab_ddic_db_table_bo=>get_by_name( me->gs_parameters-class-main_db_table_name ).
      DATA(lt_db_table_key_fields) = lr_db_table_bo->get_key_field_list( ).

      DATA lv_count TYPE i.

      FIELD-SYMBOLS <lv_code_line> LIKE LINE OF lt_code_list.

      IF lines( lt_key_fields ) = 1.

        ASSIGN lt_key_fields[ 1 ]
          TO FIELD-SYMBOL(<ls_key_field>).

        APPEND INITIAL LINE TO lt_code_list
          ASSIGNING <lv_code_line>.

        <lv_code_line> = |        { to_lower( me->gs_parameters-class-main_db_table_name ) }~{ to_lower( <ls_key_field>-db_table_field_name ) } = @{ gs_data_names-key_names-variable_name }|.

      ELSE.

        LOOP AT lt_db_table_key_fields
          ASSIGNING FIELD-SYMBOL(<ls_db_table_key>).

          DATA(lv_tabix) = sy-tabix.

          "-----------------------------------------------------------------------------
          "Search for BO key field
          "-----------------------------------------------------------------------------

          DATA(lv_bo_key_found_by_name) = abap_false.

          DATA(lv_bo_key_found_by_index) = abap_false.

          "Search by db table name and field name
          READ TABLE lt_key_fields
            ASSIGNING <ls_key_field>
            WITH KEY db_table_name        = gs_parameters-class-main_db_table_name
                     db_table_field_name  = <ls_db_table_key>-fieldname.

          IF sy-subrc = 0.

            lv_bo_key_found_by_name = abap_true.

          ENDIF.

          "Search by key field name
          IF lv_bo_key_found_by_name = abap_false.

            READ TABLE lt_key_fields
              ASSIGNING <ls_key_field>
              WITH KEY name = <ls_db_table_key>-fieldname.

            IF sy-subrc = 0.

              lv_bo_key_found_by_name = abap_true.

            ENDIF.

          ENDIF.

          "Search by index
          IF lv_bo_key_found_by_name = abap_false.

            READ TABLE lt_key_fields
              ASSIGNING <ls_key_field>
              INDEX lv_tabix.

            IF sy-subrc = 0.

              lv_bo_key_found_by_index = abap_true.

            ENDIF.

          ELSE.

            lv_bo_key_found_by_name = abap_true.

          ENDIF.

          "-----------------------------------------------------------------------------
          "Add code
          "-----------------------------------------------------------------------------
          "Add counter
          lv_count = lv_count + 1.

          IF lv_count > 1.

            <lv_code_line> = <lv_code_line> && | AND |.

          ENDIF.

          "Add code
          APPEND INITIAL LINE TO lt_code_list
            ASSIGNING <lv_code_line>.

          IF lv_bo_key_found_by_name = abap_true.

            <lv_code_line> =
              |        { to_lower( me->gs_parameters-class-main_db_table_name ) }~{ to_lower( <ls_db_table_key>-fieldname ) } | &&
              |= @{ me->gs_data_names-key_names-variable_name }-{ to_lower( <ls_key_field>-name ) }|.

          ELSEIF lv_bo_key_found_by_index = abap_true.

            <lv_code_line> =
              | "TODO: no Business Object key field found for this DB table key field|.

            APPEND INITIAL LINE TO lt_code_list
              ASSIGNING <lv_code_line>.

            <lv_code_line> =
              |        { to_lower( me->gs_parameters-class-main_db_table_name ) }~{ to_lower( <ls_db_table_key>-fieldname ) } | &&
              |= @{ me->gs_data_names-key_names-variable_name }-{ to_lower( <ls_key_field>-name ) }|.

          ELSE.


            <lv_code_line> =
              | "TODO: no Business Object key field found for this DB table key field|.

            APPEND INITIAL LINE TO lt_code_list
              ASSIGNING <lv_code_line>.

            <lv_code_line> =
              |*        { to_lower( me->gs_parameters-class-main_db_table_name ) }~{ to_lower( <ls_db_table_key>-fieldname ) } | &&
              |= @{ me->gs_data_names-key_names-variable_name }-??????|.

          ENDIF.

        ENDLOOP.

      ENDIF.

      "------------------------------------------------------------------------
      "Add error handling
      "------------------------------------------------------------------------
      IF  <lv_code_line> IS ASSIGNED.
        <lv_code_line> = <lv_code_line> && |.|.
      ENDIF.

      DATA lt_code_list_2 TYPE zab_abap_method_code_bo=>gts_data-code_list.

      lt_code_list_2 =
        VALUE #(
          ( || )
          ( |    IF sy-subrc <> 0.| )
          ( || ) ).

      APPEND LINES OF lt_code_list_2
        TO lt_code_list.

      IF lines( lt_key_fields ) > 4.

        lt_code_list_2 =
          VALUE #(
            ( |    DATA lv_keys_text type C LENGTH 255.| )
            ( || )
            ( |    CALL METHOD cl_abap_container_utilities=>fill_container_c| )
            ( |      EXPORTING| )
            ( |        im_value               = { me->gs_data_names-key_names-variable_name }| )
            ( |      IMPORTING| )
            ( |        ex_container           = lv_keys_text| )
            ( |      EXCEPTIONS| )
            ( |        illegal_parameter_type = 1| )
            ( |        OTHERS                 = 2.| )
          ).

        APPEND LINES OF lt_code_list_2
          TO lt_code_list.

      ENDIF.


      "Start MESSAGE statement
      IF lines( lt_key_fields ) > 4.
        DATA(lv_variables_text) = |&1|.

      ELSE.

        LOOP AT lt_key_fields
          ASSIGNING <ls_key_field>.

          IF lv_variables_text IS NOT INITIAL.

            lv_variables_text = lv_variables_text && |  |.

          ENDIF.

          lv_variables_text = lv_variables_text && |&| && sy-tabix.

        ENDLOOP.

      ENDIF.

      lt_code_list_2 =
        VALUE #(
          ( |      "TODO: create this message class and message. Be sure the number is unique. | )
          ( |      "{ me->gs_parameters-class-bo_object_name } { lv_variables_text } does not exist. | )
          ( |      MESSAGE e001({ to_lower( me->gs_parameters-class-message_class_name ) })| )

        ).

      APPEND LINES OF lt_code_list_2
        TO lt_code_list.

      "Add WITH statement based on key fields
      IF lines( lt_key_fields ) = 1.

        APPEND INITIAL LINE TO lt_code_list
          ASSIGNING FIELD-SYMBOL(<ls_code_line>).

        <ls_code_line> = |        WITH { gs_data_names-key_names-variable_name }|.


      ELSEIF lines( lt_key_fields ) <= 4.

        APPEND INITIAL LINE TO lt_code_list
          ASSIGNING <ls_code_line>.

        <ls_code_line> = |        WITH|.

        LOOP AT lt_key_fields
          ASSIGNING <ls_key_field>.

          APPEND INITIAL LINE TO lt_code_list
            ASSIGNING <ls_code_line>.

          <ls_code_line> = |          { me->gs_data_names-key_names-variable_name }-{ to_lower( <ls_key_field>-name ) }|.

        ENDLOOP.

      ELSE.

        APPEND INITIAL LINE TO lt_code_list
          ASSIGNING <ls_code_line>.

        <ls_code_line> = |        WITH lv_keys_text|.

      ENDIF.

      DATA(lv_return_var_name) =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = 'RETURN_EXC'
          life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_ref
          changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
        ) )->get_variable_name( ).

      lt_code_list_2 =
        VALUE #(
          ( |        INTO DATA(lv_dummy) ##NEEDED.| )
          ( || )
          ( |      DATA({ lv_return_var_name }) = zab_return_exc=>create_by_system_message( ).| )
          ( || )
          ( |      RAISE EXCEPTION { lv_return_var_name }.| )
          ( || )
          ( |    ENDIF.| )
        ).
      APPEND LINES OF lt_code_list_2
        TO lt_code_list.


    ELSE.

      "If no DB table, than no check
      lt_code_list =
        VALUE #(
          ( || )
          ( |* TODO: No BO main DB table was entered, so no check could be generated.| )
          ( || )
        ).

    ENDIF.

    "------------------------------------------------------------------------
    "Add method
    "------------------------------------------------------------------------

    DATA(ls_method) =
      VALUE zab_abap_method_code_bo=>gts_data(
        type = zab_abap_method_code_bo=>gcc_instance_method_type
        name = 'CHECK_EXISTANCE'
        parameters = VALUE #(
          (
            type      = zab_abap_method_code_bo=>gcc_exception_type
            name      = |zab_return_exc|
          )
        )
        code_list = lt_code_list
      ).

    gr_abap_class->add_method_code(
      iv_section = zab_abap_class_code_bo=>gcc_section_protected
      is_method  = ls_method
    ).


  ENDMETHOD.

  METHOD create_read_data.

    create_read_data_10_data_type( ).

    create_read_data_20_attribute( ).

*    create_read_data_30_read_meth( ).

    create_read_data_40_get_meth( ).

    create_read_data_50_clear( ).

  ENDMETHOD.

  METHOD create_new_object.

    create_new_type( ).

    create_new_method( ).

  ENDMETHOD.

  METHOD create_new_type.

    DATA lt_type_list TYPE zab_abap_type_code_bo=>gtt_type_list.

    DATA lv_id TYPE zab_abap_type_code_bo=>gtv_id.

    lv_id = 1.

    "Parent data component type
    APPEND INITIAL LINE TO lt_type_list
      ASSIGNING FIELD-SYMBOL(<ls_type>).

    <ls_type>-id        = lv_id.
    <ls_type>-parent_id = 0.
    <ls_type>-name      = gs_data_names-create_data_names-data_type_name.
    <ls_type>-kind      = zab_abap_type_code_bo=>gcc_kind_structure.

    DATA(ls_bapi_data) =
      gs_references-create_bapi->get_data( ).

    "Add importing parameters
    add_decl_parameter_type(
      EXPORTING
        iv_paramtype  = 'I'
        it_parameters = ls_bapi_data-parameters
      CHANGING
        ct_type_list  = lt_type_list
        cv_id         = lv_id ).

    "Add tables parameters
    add_decl_parameter_type(
      EXPORTING
       iv_paramtype   = 'T'
        it_parameters = ls_bapi_data-parameters
      CHANGING
        ct_type_list  = lt_type_list
        cv_id         = lv_id ).

    "If not fields
    IF lines( lt_type_list ) = 1.

      APPEND INITIAL LINE TO lt_type_list
        ASSIGNING <ls_type>.

      <ls_type>-id        = 2.
      <ls_type>-parent_id = 1.
      <ls_type>-name      = 'DUMMY_TODO_NO_FIELDS'.
      <ls_type>-kind      = zab_abap_type_code_bo=>gcc_kind_value.
      <ls_type>-data_type = 'CHAR1'.

    ENDIF.


    IF me->gs_parameters-class-interface_ind = abap_false.

      "Add key structure
      gr_abap_class->add_type_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        it_type_list = lt_type_list ).

    ELSE.

      gr_abap_class_interf->add_type_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        it_type_list = lt_type_list ).

      gr_abap_class->add_alias(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        it_aliases  =  VALUE #(
          ( alias_name     = lt_type_list[ 1 ]-name
            component_name = |{ me->gs_class_interf_data-class_name }~{ lt_type_list[ 1 ]-name }| ) )
        ).

    ENDIF.

  ENDMETHOD.

  METHOD create_new_method.

    "Example:
*    CALL FUNCTION 'BAPI_MATERIAL_SAVEDATA'
*      EXPORTING
*        headdata    = is_create-headdata
*        clientdata  = is_create-clientdata
*        clientdatax = is_create-clientdatax
*        ...
*     IMPORTING
*       RETURN      =
*     TABLES
*       MATERIALDESCRIPTION        =
*       UNITSOFMEASURE             =
*       UNITSOFMEASUREX            =
*        ...

    "*************************************************************
    "Init
    "*************************************************************

    "Set structure name
    DATA lv_structure_name    TYPE strukname.
    DATA lv_result_struc_name TYPE strukname.

    lv_structure_name = gs_data_names-create_data_names-variable_name.

    lv_result_struc_name =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = 'IMPORTING_PARAMETERS'
          life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_structure
          changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
        ) )->get_variable_name( ).

    DATA(lr_code) = NEW zab_abap_code_bo( ).

    "Get bapi get detail data
    DATA(ls_create_bapi_data) =
      gs_references-create_bapi->get_data( ).

    DATA(lt_bo_key_fields) = me->get_bo_key_fields( ).

    "*************************************************************
    "Add exporting parameters as local structure
    "*************************************************************

    DATA(lt_exporting_parameters) = get_bapi_parameters(
      it_parameters     = ls_create_bapi_data-parameters
      iv_parameter_type = 'E' ).


    DATA(lv_import_param_type_name) =
      zab_abap_variable_name_bo=>create_by_data( VALUE #(
        name            = 'IMPORTING_PARAMETERS'
        life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
        variable_kind   = zab_abap_variable_name_bo=>gcc_kind_structure
        changeable_kind = zab_abap_variable_name_bo=>gcc_type_chng_kind
      ) )->get_variable_name( ).

    IF lines( lt_exporting_parameters ) = 0.

    ELSE.

      lr_code->add_code_line( || ).
      lr_code->add_code_line( |    TYPES:| ).
      lr_code->add_code_line( |      BEGIN OF { lv_import_param_type_name },| ).


      LOOP AT lt_exporting_parameters
        ASSIGNING FIELD-SYMBOL(<ls_parameter>).

        DATA(lr_type_descr) = cl_abap_typedescr=>describe_by_name( <ls_parameter>-structure ).

        DATA(lv_parameter_name) = zab_abap_text_bo=>add_trailing_space(
          iv_text = to_lower( <ls_parameter>-parameter )
          iv_length = 30 ).

        CASE lr_type_descr->kind.

          WHEN cl_abap_typedescr=>kind_class OR cl_abap_typedescr=>kind_intf.

            lr_code->add_code_line( |        { lv_parameter_name } TYPE REF TO { to_lower( <ls_parameter>-structure ) },| ).

          WHEN OTHERS.

            lr_code->add_code_line( |        { lv_parameter_name } TYPE { to_lower( <ls_parameter>-structure ) },| ).

        ENDCASE.

      ENDLOOP.

      lr_code->add_code_line( |      END OF { lv_import_param_type_name }.| ).
      lr_code->add_code_line( || ).
      lr_code->add_code_line( |    DATA:| ).
      lr_code->add_code_line( |     { lv_result_struc_name } TYPE { lv_import_param_type_name }.| ).

    ENDIF.

    "**************************************************************************
    "Create return variables
    "**************************************************************************

    lr_code->add_code_line( | | ).
    create_return_variables(
      EXPORTING ir_bapi_bo = gs_references-create_bapi
      CHANGING  cr_code    = lr_code ).

    "**************************************************************************
    "Create local message variable
    "**************************************************************************

    DATA(lv_local_struct_name) =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = 'CREATE_DATA'
          life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_structure
          changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
        ) )->get_variable_name( ).

    lr_code->add_code_line( | | ).
    lr_code->add_code_line( |    "Copy importing parameter to local variable, because BAPIs might change TABLES parameters.| ).
    lr_code->add_code_line( |    DATA({ lv_local_struct_name }) = { lv_structure_name }.| ).

    "**************************************************************************
    "CALL FUNCTION
    "*************************************************************************

    lr_code->add_code_line( | | ).
    lr_code->add_code_line(
      |    CALL FUNCTION '| && gs_parameters-bapis-create_bapi && |'| ).

    "Exporting parameters
    add_bapi_call_parameters(
      ir_bapi_bo              = gs_references-create_bapi
      iv_param_type_statement = 'EXPORTING'
      ir_code                 = lr_code
      it_parameters           = ls_create_bapi_data-parameters
      iv_parameter_type       = 'I'
      iv_struct_variable      = lv_local_struct_name
      iv_assign_bo_key_ind    = abap_false ).

    "Importing parameters
    add_bapi_call_parameters(
      ir_bapi_bo              = gs_references-create_bapi
      iv_param_type_statement = 'IMPORTING'
      ir_code                 = lr_code
      it_parameters           = ls_create_bapi_data-parameters
      iv_parameter_type       = 'E'
      iv_struct_variable      = lv_result_struc_name ).

    "Tables parameters
    add_bapi_call_parameters(
      ir_bapi_bo              = gs_references-create_bapi
      iv_param_type_statement = 'TABLES'
      ir_code                 = lr_code
      it_parameters           = ls_create_bapi_data-parameters
      iv_parameter_type       = 'T'
      iv_struct_variable      = lv_local_struct_name ).

    lr_code->append_to_last_line( |.| ).

    "**************************************************************************
    "Error handling
    "**************************************************************************

    add_raise_exception(
      EXPORTING ir_bapi_bo = gs_references-create_bapi
      CHANGING  cr_code    = lr_code ).

    "**************************************************************************
    "Instantiate
    "**************************************************************************
    DATA(lv_return_var_name) =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = gs_class_data-variable_name
          life_time       = zab_abap_variable_name_bo=>gcc_returning_param_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_ref
          changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
        ) )->get_variable_name( ).

    lr_code->add_code_line( || ).

    DATA(lv_local_ref_var_name) =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = gs_class_data-variable_name
          life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_ref
          changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
        ) )->get_variable_name( ).


    IF me->gs_parameters-class-interface_ind = abap_false.

      lv_local_ref_var_name = lv_return_var_name.

      lr_code->add_code_line( |    { lv_local_ref_var_name } = new #( ).| ).

    ELSE.

      lr_code->add_code_line( |    DATA({ lv_local_ref_var_name }) = new { to_lower( me->gs_class_data-class_name ) }( ).| ).

    ENDIF.

    "**************************************************************************
    "Mapping key fields
    "**************************************************************************

    lr_code->add_code_line( || ).
    lr_code->add_code_line( |    "Set key| ).

    "Get key fields of the Update BAPI
    DATA(lt_create_key_fields) = me->gs_references-create_bapi->get_key_fields( ).

    IF lines( lt_bo_key_fields ) = 0 OR
       lines( lt_create_key_fields ) = 0.

      lr_code->add_code_line( |*    "TODO: Key is missing.| ).

    ELSEIF lines( lt_bo_key_fields ) = 1 AND
      lines( lt_create_key_fields ) = 1.

      READ TABLE lt_create_key_fields
        ASSIGNING FIELD-SYMBOL(<ls_create_key_field>)
        INDEX 1.

      DATA lv_key_struc_name LIKE lv_structure_name.

      IF <ls_create_key_field>-parameter_type = zab_abap_bapi_bo=>gcc_exporting_param_type.

        lv_key_struc_name = lv_result_struc_name.

      ELSE.

        lv_key_struc_name = lv_structure_name.

      ENDIF.

      lr_code->add_code_line(
        |    { lv_local_ref_var_name }->{ gs_data_names-key_names-variable_name } = | &&
        |{ lv_key_struc_name }-{ to_lower( <ls_create_key_field>-name ) }.| ).


    ELSE.

      lt_bo_key_fields = me->get_bo_key_fields( ).

      LOOP AT lt_bo_key_fields
        ASSIGNING FIELD-SYMBOL(<ls_bo_key_field>).

        DATA(ls_create_key_field) =
          get_bapi_key_field_by_bo_key(
            is_bo_key_field    = <ls_bo_key_field>
            it_bapi_key_fields = lt_create_key_fields ).

        IF ls_create_key_field IS NOT INITIAL.

          IF ls_create_key_field-parameter_type = zab_abap_bapi_bo=>gcc_exporting_param_type.

            lv_key_struc_name = lv_result_struc_name.

          ELSE.

            lv_key_struc_name = lv_structure_name.

          ENDIF.

          lr_code->add_code_line(
            |    { lv_local_ref_var_name }->{ me->gs_data_names-key_names-variable_name }-{ to_lower( <ls_bo_key_field>-name ) } = | &&
            |{ lv_key_struc_name }-{ to_lower( ls_create_key_field-name ) }.| ).

        ELSE.

          lr_code->add_code_line(
            |*    { lv_local_ref_var_name }->{ me->gs_data_names-key_names-variable_name }-{ to_lower( <ls_bo_key_field>-name ) } = |  &&
            |????? . "TODO: Key is missing| ).

        ENDIF.

      ENDLOOP.

    ENDIF.

    IF me->gs_parameters-class-interface_ind = abap_true.

      lr_code->add_code_line(
        || ).

      lr_code->add_code_line(
        |    { lv_return_var_name } = { lv_local_ref_var_name }.| ).

    ENDIF.

    "**************************************************************************
    "Create method
    "**************************************************************************

    DATA(ls_method) =
      VALUE zab_abap_method_code_bo=>gts_data(
        type = zab_abap_method_code_bo=>gcc_class_method_type
        name = gs_data_names-create_instance_method_name
        parameters = VALUE #(
          (
            type = zab_abap_method_code_bo=>gcc_importing_param_type
            name = lv_structure_name
            typing_code = zab_abap_method_code_bo=>gcc_type_typing_code
            data_type = gs_data_names-create_data_names-data_type_name
          )
          (
            type = zab_abap_method_code_bo=>gcc_returning_param_type
            name      = lv_return_var_name
            typing_code = zab_abap_method_code_bo=>gcc_type_ref_to_typing_code
            data_type = to_lower( gs_class_data-class_name )
          )
          (
            type        = zab_abap_method_code_bo=>gcc_exception_type
            name        = |zab_return_exc|
          )
        )
        code_list = lr_code->get_code_lines(
          iv_code_level = 1 )
      ).

    IF me->gs_parameters-class-interface_ind = abap_false.

      gr_abap_class->add_method_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        is_method  = ls_method ).

    ELSE.

      ls_method-parameters[ 2 ]-data_type = me->gs_class_interf_data-class_name.

      gr_abap_class_interf->add_method_code(
       iv_section = zab_abap_class_code_bo=>gcc_section_public
       is_method = ls_method ).

      ls_method-alias_component_name = |{ me->gs_class_interf_data-class_name }~{ ls_method-name }|.

      gr_abap_class->add_method_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        is_method  = ls_method ).

    ENDIF.

  ENDMETHOD.

  METHOD get_bapi_key_field_by_bo_key.

    "Match op database velden
*        FIELD-SYMBOLS  <ls_create_key_field> type ZAB_ABAP_BAPI_BO=>gts_key_field.
    LOOP AT it_bapi_key_fields
      INTO rs_bapi_key_field
      WHERE  db_table_name       = is_bo_key_field-db_table_name AND
             db_table_field_name = is_bo_key_field-db_table_field_name.

      EXIT.

    ENDLOOP.

  ENDMETHOD.

  METHOD convert_to_struct_field_name.

    IF iv_name = ''.
      RETURN.
    ENDIF.

    "Digit is not allowed as first character
    DATA(lv_first_char) = iv_name+0(1).

    IF lv_first_char CA '0123456789'.
      rv_name = |_| && iv_name.
    ELSE.
      rv_name = iv_name.
    ENDIF.

  ENDMETHOD.

  METHOD add_decl_parameter_type.

    LOOP AT it_parameters
      ASSIGNING FIELD-SYMBOL(<ls_parameter>)
      WHERE paramtype = iv_paramtype.

      DATA(lr_type_descr) = cl_abap_typedescr=>describe_by_name( <ls_parameter>-structure ).

      DATA(lv_return_ind) = zab_abap_bapi_bo=>check_is_return_variable( CONV #( <ls_parameter>-structure ) ).

      IF lv_return_ind = abap_true.

        CONTINUE.

      ENDIF.

      cv_id = cv_id + 1.

      APPEND INITIAL LINE TO ct_type_list
        ASSIGNING FIELD-SYMBOL(<ls_type>).

      CASE iv_paramtype.

        WHEN 'I' OR 'E'.

          CASE lr_type_descr->kind.

            WHEN cl_abap_typedescr=>kind_class.

              <ls_type>-id                   = cv_id.
              <ls_type>-parent_id            = 1.
              <ls_type>-name                 = convert_to_struct_field_name( <ls_parameter>-parameter ).
              <ls_type>-kind                 = zab_abap_type_code_bo=>gcc_kind_class.
              <ls_type>-data_type            = <ls_parameter>-structure.
              <ls_type>-comment_text         = |TODO: Check this field. It is a Reference field which are not usual for function modules.|.

            WHEN OTHERS.

              <ls_type>-id                   = cv_id.
              <ls_type>-parent_id            = 1.
              <ls_type>-name                 = convert_to_struct_field_name( <ls_parameter>-parameter ).
              <ls_type>-kind                 = zab_abap_type_code_bo=>gcc_kind_value.
              <ls_type>-data_type            = <ls_parameter>-structure.

          ENDCASE.

        WHEN 'T'.

          <ls_type>-id                   = cv_id.
          <ls_type>-parent_id            = 1.
          <ls_type>-name                 = <ls_parameter>-parameter.

          DATA(lr_data_component) = zab_ddic_component_type=>create_component_by_name( CONV #( <ls_parameter>-structure ) ).

          DATA(lv_type_kind) = lr_data_component->get_kind( ).

          CASE lv_type_kind.

            WHEN zab_abap_variable_bo=>gcc_kind_structure.
              <ls_type>-kind                 = zab_abap_type_code_bo=>gcc_kind_table.

            WHEN zab_abap_variable_bo=>gcc_kind_table.
              <ls_type>-kind                 = zab_abap_type_code_bo=>gcc_kind_value.

            WHEN OTHERS.
              <ls_type>-kind                 = zab_abap_type_code_bo=>gcc_kind_table.

          ENDCASE.

          <ls_type>-data_type            = <ls_parameter>-structure.
          <ls_type>-table-access_type    = zab_abap_type_code_bo=>gcc_table_access_type_standard.
          <ls_type>-table-key_definition = zab_abap_type_code_bo=>gcc_table_key_def_default.
          <ls_type>-table-key_category   = zab_abap_type_code_bo=>gcc_table_key_cat_non_unique.

        WHEN OTHERS.

          "Code error
          DATA(lr_return_exc) = zab_return_exc=>create_by_text(
            iv_message    = |Parameter type { iv_paramtype } is not supported.| ).

          RAISE EXCEPTION lr_return_exc.

      ENDCASE.

    ENDLOOP.

  ENDMETHOD.

  METHOD create_update_object.

    create_update_type(
      iv_data_type_name = CONV #( me->gs_data_names-change_data_names-data_type_name )
      ir_bapi           = gs_references-update_bapi ).

    create_update_method(
      iv_structure_name   = gs_data_names-change_data_names-variable_name
      iv_structure_name_2 = 'UPDATE_DATA'
      iv_variable_name    = gs_data_names-key_names-variable_name
      ir_bapi             = gs_references-update_bapi
      iv_clear_data_ind   = abap_true
      iv_method_name      = gs_data_names-update_data_method_name
      iv_data_type_name   = me->gs_data_names-change_data_names-data_type_name ).

  ENDMETHOD.

  METHOD create_non_crud_method.

    LOOP AT me->gs_parameters-bapis-non_cru_bapis_rng
      ASSIGNING FIELD-SYMBOL(<ls_bapi_rng>).

      DATA(lv_bapi_name) = <ls_bapi_rng>-low.

      "Cut the word BAPI from the function module name
      IF lv_bapi_name+0(4) = 'BAPI'.
        DATA(lv_method_name) = lv_bapi_name+5.
      ELSE.
        lv_method_name = lv_bapi_name.
      ENDIF.

      DATA(lr_bapi) = zab_abap_bapi_bo=>get_bapi_by_name(
        iv_bapi_name             = lv_bapi_name
        iv_db_table_name         = gs_parameters-class-main_db_table_name
        iv_bor_object_type_name  = gs_parameters-class-bor_object_type_name
        iv_action_type_name      = zab_abap_bapi_bo=>gcc_update_action_type_name ).

      DATA(lv_data_type_name) =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = lv_method_name
          life_time       = zab_abap_variable_name_bo=>gcc_class_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_structure
          changeable_kind = zab_abap_variable_name_bo=>gcc_type_chng_kind
        ) )->get_variable_name( ).

      DATA(lv_variable_name) =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = lv_method_name
          life_time       = zab_abap_variable_name_bo=>gcc_changing_param_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_structure
          changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
        ) )->get_variable_name( ).

      create_update_type(
        iv_data_type_name   = lv_data_type_name                                             "tchange_s
        ir_bapi             = lr_bapi ).                                                    "BAPI ref

      create_update_method(
        iv_structure_name   = lv_variable_name                                             "c_change_s
        iv_structure_name_2 = CONV #( lv_method_name )
        iv_variable_name    = gs_data_names-key_names-variable_name                         "key
        ir_bapi             = lr_bapi                                                       "BAPI ref
        iv_clear_data_ind   = abap_false                                                    "Clear data indicator
        iv_method_name      = CONV #( lv_method_name )                                        "UPDATE_DATA
        iv_data_type_name   = CONV #( lv_data_type_name ) ).                                "tchange_s

    ENDLOOP.

  ENDMETHOD.

  METHOD create_update_type.

    DATA lt_type_list TYPE zab_abap_type_code_bo=>gtt_type_list.

    DATA lv_id TYPE zab_abap_type_code_bo=>gtv_id.

    lv_id = 1.

    APPEND INITIAL LINE TO lt_type_list
      ASSIGNING FIELD-SYMBOL(<ls_type>).
    <ls_type>-id        = lv_id.
    <ls_type>-parent_id = 0.
    <ls_type>-name      = iv_data_type_name.
    <ls_type>-kind      = zab_abap_type_code_bo=>gcc_kind_structure.

    DATA(ls_bapi_data) =
      ir_bapi->get_data( ).

    "Add importing parameters
    add_decl_parameter_type(
      EXPORTING
        iv_paramtype  = 'I'
        it_parameters = ls_bapi_data-parameters
      CHANGING
        ct_type_list  = lt_type_list
        cv_id         = lv_id ).

    "Add tables parameters
    add_decl_parameter_type(
      EXPORTING
        iv_paramtype  = 'T'
        it_parameters = ls_bapi_data-parameters
      CHANGING
        ct_type_list  = lt_type_list
        cv_id         = lv_id ).

    IF me->gs_parameters-class-interface_ind = abap_false.

      "Add key structure
      gr_abap_class->add_type_code(
        iv_section   = zab_abap_class_code_bo=>gcc_section_public
        it_type_list = lt_type_list ).

    ELSE.

      gr_abap_class_interf->add_type_code(
        iv_section   = zab_abap_class_code_bo=>gcc_section_public
        it_type_list = lt_type_list ).

      gr_abap_class->add_alias(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        it_aliases  =  VALUE #(
          ( alias_name     = lt_type_list[ 1 ]-name
            component_name = |{ to_lower( me->gs_class_interf_data-class_name ) }~{ to_lower( lt_type_list[ 1 ]-name ) }| ) )
      ).

    ENDIF.

  ENDMETHOD.

  METHOD create_update_method.

    "**************************************************************************
    "Init
    "**************************************************************************

    DATA(ls_update_bapi_data) =
      ir_bapi->get_data( ).

    "Structure names
    DATA lv_global_struct_name TYPE strukname.
    lv_global_struct_name = iv_structure_name.

    DATA lv_local_struct_name TYPE strukname.
    lv_local_struct_name = zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = iv_structure_name_2
          life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_structure
          changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
        ) )->get_variable_name( ).

    "Create code object
    DATA(lr_code) = NEW zab_abap_code_bo( ).

    "**************************************************************************
    "Local structure for receiving exporting values
    "**************************************************************************

    DATA(lr_local_struct_code) = NEW zab_abap_code_bo( ).

    DATA(lt_parameters) =
      get_bapi_parameters(
        it_parameters      = ls_update_bapi_data-parameters
        iv_parameter_type  = 'E' ).

    DATA(lv_counter) = 0.

    IF lines( lt_parameters ) > 0.

      lr_local_struct_code->add_code_line(
        || ).

      lr_local_struct_code->add_code_line(
        |    DATA:| ).
      lr_local_struct_code->add_code_line(
        |      BEGIN OF { lv_local_struct_name },| ).

      DATA(lv_local_struct_counter) = 0.

      LOOP AT lt_parameters
        ASSIGNING FIELD-SYMBOL(<ls_parameter>).

        lv_counter = lv_counter  + 1.

        DATA(lv_parameter_name) = to_lower( <ls_parameter>-parameter ).

        DATA(lv_parameter_name_2) = zab_abap_text_bo=>add_trailing_space(
          iv_text = lv_parameter_name
          iv_length = 30 ).

        "Skip return parameters
        IF zab_abap_bapi_bo=>check_is_return_variable( CONV #( <ls_parameter>-structure ) ) = abap_true.

          CONTINUE.

        ENDIF.

        lr_local_struct_code->add_code_line(
          |        | && lv_parameter_name_2 && | TYPE { <ls_parameter>-structure },| ).

        lv_local_struct_counter = lv_local_struct_counter + 1.

      ENDLOOP.

      lr_local_struct_code->add_code_line(
        |      END OF { lv_local_struct_name }.| ).

    ENDIF.

    IF lv_local_struct_counter > 0.

      lr_code->add_code_lines( lr_local_struct_code->get_code_lines( 99 ) ).

    ENDIF.

    "**************************************************************************
    "Return variabelen
    "**************************************************************************

    "Add return table variable definitions
    create_return_variables(
      EXPORTING ir_bapi_bo = ir_bapi
      CHANGING  cr_code    = lr_code ).

    "**************************************************************************
    "Map key to change structure
    "**************************************************************************

    lr_code->add_code_line( || ).

    lr_code->add_code_line( |    "Set key| ).

    DATA(lt_key_fields) = ir_bapi->get_key_fields( ).

    "Get key fields of the Update BAPI
    DATA(lt_update_key_fields) = ir_bapi->get_key_fields( ).

    IF lines( lt_key_fields ) = 0 OR
       lines( lt_update_key_fields ) = 0.

      lr_code->add_code_line( |*    "TODO: Key is missing.| ).

    ELSEIF lines( lt_key_fields ) = 1 AND
      lines( lt_update_key_fields ) = 1.

      READ TABLE lt_update_key_fields
        ASSIGNING FIELD-SYMBOL(<ls_key_field>)
        INDEX 1.

      lr_code->add_code_line(
        |    { lv_global_struct_name }-{ to_lower( <ls_key_field>-name ) } = | &&
        |me->{ iv_variable_name }.| ).

    ELSE.

      DATA(lt_bo_key_fields) = me->get_bo_key_fields( ).

      LOOP AT lt_bo_key_fields
        ASSIGNING FIELD-SYMBOL(<ls_bo_key_field>).

        DATA(ls_bapi_key_field) =
          get_bapi_key_field_by_bo_key(
            is_bo_key_field    = <ls_bo_key_field>
            it_bapi_key_fields = lt_update_key_fields ).

        IF ls_bapi_key_field IS NOT INITIAL.

          lr_code->add_code_line(
            |    { lv_global_struct_name }-{ to_lower( ls_bapi_key_field-name ) } = | &&
            |{ iv_variable_name }-{ to_lower( <ls_bo_key_field>-name ) }.| ).

        ELSE.

          lr_code->add_code_line(
            |*    { lv_global_struct_name }-??? = | &&
            |{ iv_variable_name }-{ <ls_bo_key_field>-name }. "TODO: Key is missing| ).

        ENDIF.

      ENDLOOP.

    ENDIF.

    "**************************************************************************
    "CALL FUNCTION
    "**************************************************************************

    lr_code->add_code_line( || ).
    lr_code->add_code_line( |    "Call function module| ).
    lr_code->add_code_line(
      |    CALL FUNCTION '| && ls_update_bapi_data-header-funcname && |'| ).

    "Exporting parameters
    add_bapi_call_parameters(
      ir_bapi_bo              = ir_bapi
      iv_param_type_statement = 'EXPORTING'
      ir_code                 = lr_code
      it_parameters           = ls_update_bapi_data-parameters
      iv_parameter_type       = 'I'
      iv_struct_variable      = lv_global_struct_name ).

    "Importing parameters
    add_bapi_call_parameters(
      ir_bapi_bo              = ir_bapi
      iv_param_type_statement = 'IMPORTING'
      ir_code                 = lr_code
      it_parameters           = ls_update_bapi_data-parameters
      iv_parameter_type       = 'E'
      iv_struct_variable      = lv_local_struct_name ).

    "Tables parameters
    add_bapi_call_parameters(
      ir_bapi_bo              = ir_bapi
      iv_param_type_statement = 'TABLES'
      ir_code                 = lr_code
      it_parameters           = ls_update_bapi_data-parameters
      iv_parameter_type       = 'T'
      iv_struct_variable      = lv_global_struct_name ).

    lr_code->append_to_last_line( |.| ).

    "**************************************************************************
    "Error handling
    "**************************************************************************

    add_raise_exception(
      EXPORTING ir_bapi_bo = ir_bapi
      CHANGING  cr_code    = lr_code ).

    "**************************************************************************
    "Clear data
    "**************************************************************************
    IF iv_clear_data_ind = abap_true.

      IF me->gs_parameters-bapis-read_bapi IS NOT INITIAL.

        lr_code->add_code_line( || ).
        lr_code->add_code_line( |    clear_data( ).| ).

      ENDIF.

    ENDIF.

    "**************************************************************************
    "Create method
    "**************************************************************************

    DATA(ls_method) =
      VALUE zab_abap_method_code_bo=>gts_data(
          type = zab_abap_method_code_bo=>gcc_instance_method_type
          name = iv_method_name
          parameters = VALUE #(
            (
              type        = zab_abap_method_code_bo=>gcc_changing_param_type
              name        = lv_global_struct_name
              typing_code = zab_abap_method_code_bo=>gcc_type_typing_code
              data_type   = iv_data_type_name
            )
            (
              type        = zab_abap_method_code_bo=>gcc_exception_type
              name        = |zab_return_exc|
            )
          )
          code_list = lr_code->get_code_lines(
            iv_code_level = 1 ) ).

    IF me->gs_parameters-class-interface_ind = abap_false.

      gr_abap_class->add_method_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        is_method  = ls_method ).

    ELSE.

      ls_method-parameters[ 2 ]-data_type = me->gs_class_interf_data-class_name.

      gr_abap_class_interf->add_method_code(
       iv_section = zab_abap_class_code_bo=>gcc_section_public
       is_method = ls_method ).

      ls_method-alias_component_name = |{ me->gs_class_interf_data-class_name }~{ ls_method-name }|.

      gr_abap_class->add_method_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        is_method  = ls_method ).

    ENDIF.

  ENDMETHOD.

  METHOD add_raise_exception.

    DATA(lv_spaces) = zab_abap_text_bo=>get_spaces(
      iv_tab_character_count = 2
      iv_tab_count           = 2 ).

    DATA(ls_return_meta_data) = ir_bapi_bo->get_return_variable_meta_data( ).

    IF ls_return_meta_data IS INITIAL.

      cr_code->add_code_line( || ).
      cr_code->add_code_line( |*TODO; Function module / BAPI has no RETURN parameter. Handle the exceptions. | ).

      RETURN.

    ENDIF.

    DATA(lv_return_ref_var_name) =
      zab_abap_variable_name_bo=>create_by_data( VALUE #(
        name            = 'RETURN_EXC'
        life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
        variable_kind   = zab_abap_variable_name_bo=>gcc_kind_ref
        changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
      ) )->get_variable_name( ).

    cr_code->add_code_line( || ).
    cr_code->add_code_line( |{ lv_spaces }DATA({ lv_return_ref_var_name }) =| ).

    CASE ls_return_meta_data-structure_name.

      WHEN zab_abap_bapi_bo=>gcc_bapireturn_struct_name.

        CASE ls_return_meta_data-parameter_type.

          WHEN 'E'.

            cr_code->add_code_line( |{ lv_spaces }  zab_return_exc=>create_by_bapireturn_struc(| ).
            cr_code->add_code_line( |{ lv_spaces }    is_return = { me->gs_data_names-return_struct_names-variable_name } ).| ).

          WHEN 'T'.

            cr_code->add_code_line( |{ lv_spaces }  zab_return_exc=>create_by_bapireturn_table(| ).
            cr_code->add_code_line( |{ lv_spaces }    it_return = { me->gs_data_names-return_table_names-variable_name } ).| ).

        ENDCASE.

      WHEN zab_abap_bapi_bo=>gcc_bapiret1_struct_name.

        CASE ls_return_meta_data-parameter_type.

          WHEN 'E'.

            cr_code->add_code_line( |{ lv_spaces }  zab_return_exc=>create_by_bapiret1_struc(| ).
            cr_code->add_code_line( |{ lv_spaces }    is_return = { me->gs_data_names-return_struct_names-variable_name } ).| ).

          WHEN 'T'.

            cr_code->add_code_line( |{ lv_spaces }  zab_return_exc=>create_by_bapiret1_table(| ).
            cr_code->add_code_line( |{ lv_spaces }    it_return = { me->gs_data_names-return_table_names-variable_name } ).| ).

        ENDCASE.

      WHEN zab_abap_bapi_bo=>gcc_bapiret2_struct_name.

        CASE ls_return_meta_data-parameter_type.

          WHEN 'E'.

            cr_code->add_code_line( |{ lv_spaces }  zab_return_exc=>create_by_bapiret2_struc(| ).
            cr_code->add_code_line( |{ lv_spaces }    is_return = { me->gs_data_names-return_struct_names-variable_name } ).| ).

          WHEN 'T'.

            cr_code->add_code_line( |{ lv_spaces }  zab_return_exc=>create_by_bapiret2_table(| ).
            cr_code->add_code_line( |{ lv_spaces }    it_return = { me->gs_data_names-return_table_names-variable_name } ).| ).

        ENDCASE.

      WHEN zab_abap_bapi_bo=>gcc_bapireturn1_struct_name.

        CASE ls_return_meta_data-parameter_type.

          WHEN 'E'.

            cr_code->add_code_line( |{ lv_spaces }  zab_return_exc=>create_by_bapiret1_struc(| ).
            cr_code->add_code_line( |{ lv_spaces }    is_return = { me->gs_data_names-return_struct_names-variable_name } ).| ).

          WHEN 'T'.

            cr_code->add_code_line( |{ lv_spaces }  zab_return_exc=>create_by_bapiret1_table(| ).
            cr_code->add_code_line( |{ lv_spaces }    it_return = { me->gs_data_names-return_table_names-variable_name } ).| ).

        ENDCASE.

      WHEN OTHERS.

        "Code error
        DATA(lr_return_exc) = zab_return_exc=>create_by_text(
          iv_message    = |Parameter type { ls_return_meta_data-parameter_type } is not supported.| ).

        RAISE EXCEPTION lr_return_exc.

    ENDCASE.

    cr_code->add_code_line( || ).
    cr_code->add_code_line( |{ lv_spaces }IF { lv_return_ref_var_name } IS NOT INITIAL.| ).
    cr_code->add_code_line( || ).
    cr_code->add_code_line( |{ lv_spaces }  RAISE EXCEPTION { lv_return_ref_var_name }.| ).
    cr_code->add_code_line( || ).
    cr_code->add_code_line( |{ lv_spaces }ENDIF.| ).

  ENDMETHOD.

  METHOD get_bapi_parameters.

    LOOP AT it_parameters
      ASSIGNING FIELD-SYMBOL(<ls_parameter>)
      WHERE paramtype = iv_parameter_type.

      APPEND <ls_parameter>
        TO rt_parameters.

    ENDLOOP.

  ENDMETHOD.

  METHOD add_bapi_call_parameters.

    DATA(lt_key_fields) = get_bo_key_fields( ).

    DATA(lt_parameters) =
      get_bapi_parameters(
        it_parameters      = it_parameters
        iv_parameter_type  = iv_parameter_type ).

    DATA(lv_counter) = 0.

    "Loop at parameters
    LOOP AT lt_parameters
      ASSIGNING FIELD-SYMBOL(<ls_parameter>)
      WHERE paramtype = iv_parameter_type.

      "Initi
      lv_counter = lv_counter  + 1.

      IF lv_counter = 1.
        ir_code->add_code_line( |      | && iv_param_type_statement ).
      ENDIF.

      DATA(lv_parameter_name) = to_lower( <ls_parameter>-parameter ).

      DATA(lv_parameter_name_2) = zab_abap_text_bo=>add_trailing_space(
        iv_text = lv_parameter_name
        iv_length = 30 ).

      lv_parameter_name = me->convert_to_struct_field_name( CONV #( lv_parameter_name ) ).

      "Check return variable
      IF zab_abap_bapi_bo=>check_is_return_variable( CONV #( <ls_parameter>-structure ) ).

        CASE iv_parameter_type.

          WHEN 'E'.

            DATA(lv_return_variable) = me->gs_data_names-return_struct_names-variable_name.

          WHEN  'T'.

            lv_return_variable = me->gs_data_names-return_table_names-variable_name.

          WHEN OTHERS.

            "Code error
            DATA(lr_return_exc) = zab_return_exc=>create_by_text(
              iv_message    = |Table access type { iv_parameter_type } is not supported.| ).

            RAISE EXCEPTION lr_return_exc.

        ENDCASE.

        ir_code->add_code_line(
          |        | && lv_parameter_name_2 && | = | && lv_return_variable  ).

      ELSE.

        IF iv_assign_bo_key_ind = abap_true AND iv_parameter_type = 'I'.

          READ TABLE lt_key_fields
            WITH KEY name = <ls_parameter>-parameter
            ASSIGNING FIELD-SYMBOL(<ls_key_field>).

          IF sy-subrc <> 0.

            ir_code->add_code_line(
              |        | && lv_parameter_name_2 && | = | && iv_struct_variable && |-| && lv_parameter_name ).

          ELSEIF lines( lt_key_fields ) = 1.

            ir_code->add_code_line(
              |        { lv_parameter_name_2 } = { gs_data_names-key_names-variable_name }| ).

          ELSE.

            ir_code->add_code_line(
              |        { lv_parameter_name_2 } = { gs_data_names-key_names-variable_name }-{ lv_parameter_name }| ).

          ENDIF.

        ELSE.

          ir_code->add_code_line(
            |        | && lv_parameter_name_2 && | = | && iv_struct_variable && |-| && lv_parameter_name ).

        ENDIF.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD create_read_data_10_data_type.

*    Example:
*    TYPES:
*      BEGIN OF gts_data,
*
*        "Importing parameters
*        material_general_data TYPE bapimatdoa,
*        "RETURN LIKE BAPIRETURN
*        materialplantdata     TYPE bapimatdoc,
*        materialvaluationdata TYPE bapimatdobew,
*
*        "Tables
*
*      END OF gts_data.

    DATA lt_type_list TYPE zab_abap_type_code_bo=>gtt_type_list.

    DATA lv_id TYPE zab_abap_type_code_bo=>gtv_id.

    "Add structure variable
    lv_id = 1.

    APPEND INITIAL LINE TO lt_type_list
      ASSIGNING FIELD-SYMBOL(<ls_type>).
    <ls_type>-id        = lv_id.
    <ls_type>-parent_id = 0.
    <ls_type>-name      = gs_data_names-read_data_names-data_type_name.
    <ls_type>-kind      = zab_abap_type_code_bo=>gcc_kind_structure.

    "Get BAPI data
    DATA(ls_bapi_data) =
      gs_references-read_bapi->get_data( ).

    "Add importing parameters
    add_decl_parameter_type(
      EXPORTING
        iv_paramtype  = 'E'
        it_parameters = ls_bapi_data-parameters
      CHANGING
        ct_type_list  = lt_type_list
        cv_id         = lv_id ).

    "Add tables parameters
    add_decl_parameter_type(
      EXPORTING
       iv_paramtype   = 'T'
        it_parameters = ls_bapi_data-parameters
      CHANGING
        ct_type_list  = lt_type_list
        cv_id         = lv_id ).

    "Add dummy field
    IF lines( lt_type_list ) = 1.

      lv_id = lv_id + 1.

      APPEND INITIAL LINE TO lt_type_list
        ASSIGNING <ls_type>.
      <ls_type>-id           = lv_id.
      <ls_type>-parent_id    = 1.
      <ls_type>-name         = 'DUMMY'.
      <ls_type>-kind         = zab_abap_type_code_bo=>gcc_kind_value.
      <ls_type>-data_type    = 'CHAR1'.
      <ls_type>-comment_text = |" TODO: Read function module { me->gs_parameters-bapis-read_bapi } has no exporting data.|.

    ENDIF.


    IF me->gs_parameters-class-interface_ind = abap_false.

      "Add key structure
      gr_abap_class->add_type_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        it_type_list = lt_type_list ).

    ELSE.

      me->gr_abap_class_interf->add_type_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        it_type_list = lt_type_list ).

      gr_abap_class->add_alias(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        it_aliases  =  VALUE #(
          ( alias_name     = lt_type_list[ 1 ]-name
            component_name = |{ to_lower( me->gs_class_interf_data-class_name ) }~{ to_lower( lt_type_list[ 1 ]-name ) }| ) )
      ).

    ENDIF.

  ENDMETHOD.

  METHOD create_read_data_20_attribute.

    gr_abap_class->add_data_code(
      iv_section = zab_abap_class_code_bo=>gcc_section_protected
      it_data_list = VALUE #(
        (
          id         = 1
          parent_id  = 0
          name      = me->gs_data_names-read_data_names-variable_name
          kind      = zab_abap_type_code_bo=>gcc_kind_value
          data_type = gs_data_names-read_data_names-data_type_name ) ) ).

  ENDMETHOD.

  METHOD create_read_data_40_get_meth.

    "**************************************************************************
    "Get key fields
    "**************************************************************************

    DATA(lt_read_key_fields) = gs_references-read_bapi->get_key_fields( ).

    DATA(lt_bo_key_fields) = me->get_bo_key_fields( ).

    "**************************************************************************
    "Check data is already read
    "**************************************************************************

    DATA(lr_code) = NEW zab_abap_code_bo( ).

    lr_code->add_code_line( || ).
    lr_code->add_code_line( |    "Check data is already read| ).
    lr_code->add_code_line( |    IF { gs_data_names-read_data_names-variable_name } IS NOT INITIAL.| ).
    lr_code->add_code_line( |      RETURN.| ).
    lr_code->add_code_line( |    ENDIF.| ).

    "Get bapi get detail data
    DATA(ls_read_bapi_data) =
      gs_references-read_bapi->get_data( ).

    "**************************************************************************
    "Define return parameter
    "**************************************************************************

    create_return_variables(
      EXPORTING ir_bapi_bo = gs_references-read_bapi
      CHANGING  cr_code    = lr_code ).

    "**************************************************************************
    "For BAPI with view parameter - declaration
    "**************************************************************************

    DATA(ls_view_struc) = gs_references-read_bapi->get_view_struc_param( ).

    IF ls_view_struc IS NOT INITIAL.

      DATA(lr_view_struc_type_descr) = cl_abap_typedescr=>describe_by_name( ls_view_struc-structure ).

      CASE lr_view_struc_type_descr->kind.

        WHEN cl_abap_typedescr=>kind_struct.

          DATA(lv_view_struc_var_name) =
            zab_abap_variable_name_bo=>create_by_data( VALUE #(
              name            = ls_view_struc-parameter
              life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
              variable_kind   = zab_abap_variable_name_bo=>gcc_kind_structure
              changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
            ) )->get_variable_name( ).

          DATA(lr_view_struc_descr) = CAST cl_abap_structdescr( lr_view_struc_type_descr ).

          lr_code->add_code_line( || ).
          lr_code->add_code_line( |    "Set view indicator - TODO: make the view selection more complex if performance is an issue.| ).
          lr_code->add_code_line(
            |    DATA({ lv_view_struc_var_name }) = | &&
            |VALUE {  to_lower( ls_view_struc-structure )  }(| ).

          DATA(lt_components) = lr_view_struc_descr->get_components( ).

          LOOP AT lt_components
            ASSIGNING FIELD-SYMBOL(<ls_component>).

            CASE <ls_component>-type->kind.

              WHEN cl_abap_typedescr=>kind_elem.

                DATA(lr_element_descr) = CAST cl_abap_elemdescr( <ls_component>-type ).

                DATA(ls_ddic) = lr_element_descr->get_ddic_field( ).

                IF ls_ddic-domname = 'XFELD'.

                  DATA(lv_field_name) =
                    to_lower(
                      zab_abap_text_bo=>add_trailing_space(
                        iv_text = <ls_component>-name
                        iv_length = 30 ) ).

                  lr_code->add_code_line( |      { lv_field_name } = abap_true| ).

                ENDIF.

            ENDCASE.

          ENDLOOP.

          lr_code->append_to_last_line( | ).| ).

      ENDCASE.

    ENDIF.


    "**************************************************************************
    "Set key fields if it is a LIST BAPI
    "**************************************************************************

    LOOP AT lt_read_key_fields
      ASSIGNING FIELD-SYMBOL(<ls_read_key_field>)
      WHERE parameter_type = zab_abap_function_module_bo=>gcc_tables_param_type.

      EXIT.

    ENDLOOP.

    IF sy-subrc = 0.

      DATA(lv_key_param_var_name) =
      zab_abap_variable_name_bo=>create_by_data( VALUE #(
        name            = <ls_read_key_field>-structure_name
        life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
        variable_kind   = zab_abap_variable_name_bo=>gcc_kind_structure
        changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
      ) )->get_variable_name( ).

      lr_code->add_code_line( || ).
      lr_code->add_code_line( |    APPEND INITIAL LINE TO { gs_data_names-read_data_names-variable_name }-{ to_lower( <ls_read_key_field>-structure_name ) }| ).
      lr_code->add_code_line( |      ASSIGNING FIELD-SYMBOL(<{ lv_key_param_var_name }>).| ).
      lr_code->add_code_line( || ).

      IF lines( lt_read_key_fields ) = 1.



        lr_code->add_code_line( |    <{ lv_key_param_var_name }>-{ to_lower( <ls_read_key_field>-struc_field_name ) }  = me->{ gs_data_names-key_names-variable_name }.| ).

      ELSE.

        LOOP AT lt_read_key_fields
          ASSIGNING <ls_read_key_field>.

          READ TABLE lt_bo_key_fields
            ASSIGNING FIELD-SYMBOL(<ls_key_field>)
            INDEX sy-tabix.

          lr_code->add_code_line( |    <{ lv_key_param_var_name }>-{ to_lower( <ls_read_key_field>-struc_field_name ) }  = | &&
          |me->{ gs_data_names-key_names-variable_name }-{ <ls_key_field>-name }.| ).

        ENDLOOP.

      ENDIF.

    ENDIF.

    "**************************************************************************
    "CALL FUNCTION
    "**************************************************************************

    lr_code->add_code_line( | | ).
    lr_code->add_code_line(
      |    CALL FUNCTION '| && gs_parameters-bapis-read_bapi && |'| ).

    "Exporting parameters
    DATA(lr_importing_code) = NEW zab_abap_code_bo( ).

    DATA lv_counter TYPE i.

    DATA(lt_copy_of_bo_key_fields) = lt_bo_key_fields[].

    DATA lv_importing_ind TYPE xfeld.

    LOOP AT ls_read_bapi_data-parameters
      ASSIGNING FIELD-SYMBOL(<ls_parameter>)
      WHERE paramtype = 'I'.

      DATA(lv_parameter_name) = to_lower( <ls_parameter>-parameter ).

      lv_parameter_name = zab_abap_text_bo=>add_trailing_space(
        iv_text = lv_parameter_name
        iv_length = 30 ).

      "If BAPI key field found
      READ TABLE lt_read_key_fields
        WITH KEY name = <ls_parameter>-parameter
        ASSIGNING <ls_read_key_field>.

      IF sy-subrc = 0.

        "Get BO key field by BAPI key field name
        READ TABLE lt_copy_of_bo_key_fields
          WITH KEY name = <ls_parameter>-parameter
          INTO DATA(ls_bo_key_field).

        DATA(lv_tabix) = sy-tabix.
        DATA(lv_subrc) = sy-subrc.

        IF lv_subrc = 0.

          DELETE lt_copy_of_bo_key_fields INDEX lv_tabix.

        ENDIF.

        "Search by DB table
        IF lv_subrc <> 0.

          READ TABLE lt_copy_of_bo_key_fields
            WITH KEY
              db_table_name       = <ls_read_key_field>-db_table_name
              db_table_field_name = <ls_read_key_field>-db_table_field_name
            INTO ls_bo_key_field.

          lv_tabix = sy-tabix.
          lv_subrc = sy-subrc.

          IF lv_subrc = 0.

            DELETE lt_copy_of_bo_key_fields INDEX lv_tabix.

          ENDIF.

        ENDIF.

        "Search by data element name
        IF lv_subrc <> 0 AND <ls_read_key_field>-data_element_name IS NOT INITIAL.

          READ TABLE lt_copy_of_bo_key_fields
            WITH KEY
              data_element_name      = <ls_read_key_field>-data_element_name
            INTO ls_bo_key_field.

          lv_tabix = sy-tabix.
          lv_subrc = sy-subrc.

          IF lv_subrc = 0.

            DELETE lt_copy_of_bo_key_fields INDEX lv_tabix.

          ENDIF.

        ENDIF.

        "Set parameter
        IF lv_subrc <> 0.

          IF lines( lt_read_key_fields ) = 1.

            DATA lv_line TYPE string.
            lv_line =
              |        | && lv_parameter_name && | = { gs_data_names-key_names-variable_name }  "TODO: Key does not seem to match. Check it.|.

            lv_importing_ind = abap_true.

          ELSE.

            lv_line =
              |*       | && lv_parameter_name && | = { gs_data_names-key_names-variable_name }- TODO: No corresponding key field found|.

          ENDIF.

        ELSE.

          IF lines( lt_read_key_fields ) = 1.

            lv_line =
              |        | && lv_parameter_name && | = { gs_data_names-key_names-variable_name }|.

            lv_importing_ind = abap_true.

          ELSE.

            lv_line =
              |        | && lv_parameter_name && | = { gs_data_names-key_names-variable_name }-{ to_lower( ls_bo_key_field-name ) }|.

            lv_importing_ind = abap_true.

          ENDIF.

        ENDIF.

      ELSEIF ls_view_struc-parameter = <ls_parameter>-parameter.

        lv_line =
          |        | && lv_parameter_name && | = { lv_view_struc_var_name }|.

        lv_importing_ind = abap_true.

      ELSE.

        lv_line =
          |*       | && lv_parameter_name && | =    "TODO: check if this parameter should be filled|.

        DATA(lv_star_importing_ind) = abap_true.

      ENDIF.

      lr_importing_code->add_code_line( lv_line ).

      "Initialize
      CLEAR ls_bo_key_field.

    ENDLOOP.

    IF lv_importing_ind = abap_true.

      lr_code->add_code_line( |      EXPORTING| ).

    ELSEIF lv_star_importing_ind = abap_true.

      lr_code->add_code_line( |*      EXPORTING| ).

    ENDIF.

    lr_code->add_code_lines(
      lr_importing_code->get_code_lines(
        iv_code_level = 1 ) ).

    CLEAR lr_importing_code.

    "Importing parameters
    add_bapi_call_parameters(
      ir_bapi_bo              = gs_references-read_bapi
      iv_param_type_statement = 'IMPORTING'
      ir_code                 = lr_code
      it_parameters           = ls_read_bapi_data-parameters
      iv_parameter_type       = 'E'
      iv_struct_variable      = gs_data_names-read_data_names-variable_name ).

    "Table parameters
    add_bapi_call_parameters(
      ir_bapi_bo              = gs_references-read_bapi
      iv_param_type_statement = 'TABLES'
      ir_code                 = lr_code
      it_parameters           = ls_read_bapi_data-parameters
      iv_parameter_type       = 'T'
      iv_struct_variable      = gs_data_names-read_data_names-variable_name ).

    "End
    lr_code->append_to_last_line( |.| ).

    "**************************************************************************
    "Error handling
    "**************************************************************************

    add_raise_exception(
      EXPORTING ir_bapi_bo = gs_references-read_bapi
      CHANGING  cr_code    = lr_code ).

    "**************************************************************************
    "Set return variable
    "**************************************************************************

    DATA(lv_return_variable_name) =
      zab_abap_variable_name_bo=>create_by_data( VALUE #(
        name            = gs_parameters-class-abap_object_name
        life_time       = zab_abap_variable_name_bo=>gcc_returning_param_life_time
        variable_kind   = zab_abap_variable_name_bo=>gcc_kind_structure
        changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
      ) )->get_variable_name( ).

    lr_code->add_code_line( || ).
    lr_code->add_code_line( |    IF { lv_return_variable_name } IS REQUESTED.| ).
    lr_code->add_code_line( || ).
    lr_code->add_code_line( |      { lv_return_variable_name } = { gs_data_names-read_data_names-variable_name }.| ).
    lr_code->add_code_line( || ).
    lr_code->add_code_line( |    ENDIF.| ).

    "**************************************************************************
    "Add method
    "**************************************************************************

    DATA(ls_method) =
      VALUE zab_abap_method_code_bo=>gts_data(
        type = zab_abap_method_code_bo=>gcc_instance_method_type
        name = gs_data_names-get_data_method_name
        parameters = VALUE #(
          (
            type        = zab_abap_method_code_bo=>gcc_returning_param_type
            name        = lv_return_variable_name
            typing_code = zab_abap_method_code_bo=>gcc_type_typing_code
            data_type   = gs_data_names-read_data_names-data_type_name
          )
          (
            type        = zab_abap_method_code_bo=>gcc_exception_type
            name        = |zab_return_exc|
          )
        )
        code_list =
          lr_code->get_code_lines(
            iv_code_level = 1 )
      ).

    IF me->gs_parameters-class-interface_ind = abap_false.

      gr_abap_class->add_method_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        is_method  = ls_method
      ).

    ELSE.

      gr_abap_class_interf->add_method_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        is_method = ls_method
      ).

      ls_method-alias_component_name = |{ me->gs_class_interf_data-class_name }~{ ls_method-name }|.

      gr_abap_class->add_method_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        is_method  = ls_method
      ).

    ENDIF.

  ENDMETHOD.

  METHOD add_param_exporting.

    DATA(lv_counter) = 0.

    LOOP AT is_function_module_data-parameters
      ASSIGNING FIELD-SYMBOL(<ls_parameter>)
      WHERE paramtype = 'E'.

      lv_counter = lv_counter  + 1.

      IF lv_counter = 1.
        cr_code->add_code_line( |      IMPORTING| ).
      ENDIF.

      DATA(lv_parameter_name) = to_lower( <ls_parameter>-parameter ).

      DATA(lv_parameter_name_2) = zab_abap_text_bo=>add_trailing_space(
        iv_text = lv_parameter_name
        iv_length = 30 ).

      IF zab_abap_bapi_bo=>check_is_return_variable( CONV #( <ls_parameter>-structure ) ) = abap_true.

        cr_code->add_code_line(
          |        | && lv_parameter_name_2 && | = ls_return| ).

      ELSE.

        cr_code->add_code_line(
          |        | && lv_parameter_name_2 && | = gs_parameters-| && lv_parameter_name ).

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD create_return_variables.

    TYPES ltv_return_type TYPE string.

    CONSTANTS:
      lc_bapireturn_struc_data_type  TYPE ltv_return_type VALUE 'BAPIRETURN_STRUC',
      lc_bapireturn_table_data_type  TYPE ltv_return_type VALUE 'BAPIRETURN_TABLE',

      lc_bapireturn1_struc_data_type TYPE ltv_return_type VALUE 'BAPIRETURN1_STRUC',
      lc_bapireturn1_table_data_type TYPE ltv_return_type VALUE 'BAPIRETURN1_TABLE',

      lc_bapiret2_struc_data_type    TYPE ltv_return_type VALUE 'BAPIRET2_STRUC',
      lc_bapiret2_table_data_type    TYPE ltv_return_type VALUE 'BAPIRET2_TABLE'.

    DATA: lv_return_type TYPE string.

    DATA(ls_bapi_data) = ir_bapi_bo->get_data( ).

    gs_data_names-return_struct_names-variable_name =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = 'RETURN'
          life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_structure
          changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
        ) )->get_variable_name( ).

    gs_data_names-return_table_names-variable_name =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = 'RETURN'
          life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_table
          changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
        ) )->get_variable_name( ).


    "Get return parameter
    LOOP AT ls_bapi_data-parameters
      ASSIGNING FIELD-SYMBOL(<ls_parameter>)
      WHERE paramtype = 'E' OR
            paramtype = 'T'.

      DATA(lv_return_ind) = zab_abap_bapi_bo=>check_is_return_variable( CONV #( <ls_parameter>-structure ) ).

      IF lv_return_ind = abap_true.

        CASE <ls_parameter>-paramtype.

          WHEN 'E'. "Exporting parameter

            cr_code->add_code_line(
              || ).

            cr_code->add_code_line(
              |    DATA { gs_data_names-return_struct_names-variable_name } TYPE | && to_lower( <ls_parameter>-structure ) && |.| ).


          WHEN 'T'. "Tables parameter

            cr_code->add_code_line(
              || ).

            cr_code->add_code_line(
              |    DATA { gs_data_names-return_table_names-variable_name } TYPE STANDARD TABLE OF | && to_lower( <ls_parameter>-structure ) && | WITH DEFAULT KEY.| ).

        ENDCASE.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD create_read_data_50_clear.

    gr_abap_class->add_method_code(
      iv_section = zab_abap_class_code_bo=>gcc_section_protected
      is_method = VALUE #(
        type = zab_abap_method_code_bo=>gcc_instance_method_type
        name = 'clear_data'
        code_list = VALUE #(
          ( || )
          ( |    CLEAR { gs_data_names-read_data_names-variable_name }.| )
        )
      )
    ).

  ENDMETHOD.

  METHOD set_names.

    DATA(lt_key_fields) = me->get_bo_key_fields( ).

    "KEY_NAMES
    IF lines( lt_key_fields ) = 1.

      gs_data_names-key_names-variable_name =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = 'KEY'
          life_time       = zab_abap_variable_name_bo=>gcc_class_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_value
          changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
        ) )->get_variable_name( ).

      gs_data_names-key_names-data_type_name =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = 'KEY'
          life_time       = zab_abap_variable_name_bo=>gcc_class_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_value
          changeable_kind = zab_abap_variable_name_bo=>gcc_type_chng_kind
        ) )->get_variable_name( ).

    ELSE.

      gs_data_names-key_names-variable_name =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = 'KEY'
          life_time       = zab_abap_variable_name_bo=>gcc_class_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_structure
          changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
        ) )->get_variable_name( ).

      gs_data_names-key_names-data_type_name =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = 'KEY'
          life_time       = zab_abap_variable_name_bo=>gcc_class_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_structure
          changeable_kind = zab_abap_variable_name_bo=>gcc_type_chng_kind
        ) )->get_variable_name( ).

    ENDIF.

    "-------------------------------------------------------------------------
    " Set data
    "-------------------------------------------------------------------------

    "CREATE_DATA_NAMES
    gs_data_names-create_data_names-data_type_name =
      zab_abap_variable_name_bo=>create_by_data( VALUE #(
        name              = 'CREATE_DATA'
        life_time         = zab_abap_variable_name_bo=>gcc_class_life_time
        variable_kind     = zab_abap_variable_name_bo=>gcc_kind_structure
        changeable_kind   = zab_abap_variable_name_bo=>gcc_type_chng_kind
        ) )->get_variable_name( ).

    gs_data_names-create_data_names-variable_name =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = 'CREATE_DATA'
          life_time       = zab_abap_variable_name_bo=>gcc_importing_param_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_structure
          changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
        ) )->get_variable_name( ).

    "READ_DATA_NAMES
    gs_data_names-read_data_names-data_type_name =
      zab_abap_variable_name_bo=>create_by_data( VALUE #(
        name              = 'READ_DATA'
        life_time         = zab_abap_variable_name_bo=>gcc_class_life_time
        variable_kind     = zab_abap_variable_name_bo=>gcc_kind_structure
        changeable_kind   = zab_abap_variable_name_bo=>gcc_type_chng_kind
      ) )->get_variable_name( ).

    gs_data_names-read_data_names-variable_name =
      zab_abap_variable_name_bo=>create_by_data( VALUE #(
        name              = 'READ_DATA'
        life_time         = zab_abap_variable_name_bo=>gcc_class_life_time
        variable_kind     = zab_abap_variable_name_bo=>gcc_kind_structure
        changeable_kind   = zab_abap_variable_name_bo=>gcc_variable_chng_kind
      ) )->get_variable_name( ).

    "CHANGE_DATA_NAMES
    me->gs_data_names-change_data_names-data_type_name =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = 'UPDATE_DATA'
          life_time       = zab_abap_variable_name_bo=>gcc_class_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_structure
          changeable_kind = zab_abap_variable_name_bo=>gcc_type_chng_kind
        ) )->get_variable_name( ).

    "Set structure changing parameter name
    gs_data_names-change_data_names-variable_name =
      zab_abap_variable_name_bo=>create_by_data( VALUE #(
        name              = 'UPDATE_DATA'
        life_time         = zab_abap_variable_name_bo=>gcc_changing_param_life_time
        variable_kind     = zab_abap_variable_name_bo=>gcc_kind_structure
        changeable_kind   = zab_abap_variable_name_bo=>gcc_variable_chng_kind
      ) )->get_variable_name( ).

    "-------------------------------------------------------------------------
    " Return variables
    "-------------------------------------------------------------------------
*          return_struct_names         TYPE gts_variable_names,
*          return_table_names          TYPE gts_variable_names,

    "-------------------------------------------------------------------------
    " Set method names
    "-------------------------------------------------------------------------

    gs_data_names-create_instance_method_name = 'CREATE_INSTANCE_BO'.
    gs_data_names-get_instance_method_name    = 'GET_INSTANCE_BO'.

    gs_data_names-get_data_method_name        = 'GET_DATA'.
    gs_data_names-update_data_method_name     = 'UPDATE_DATA'.

  ENDMETHOD.

  METHOD create_class_and_interface.

    CASE me->gs_parameters-class-interface_ind.

      WHEN abap_false.

        DATA(ls_create_new) =
          VALUE zab_abap_class_code_bo=>gts_create_new(
            prefix_name        = 'Z'
            module_abbrev      = gs_parameters-class-module_abbrev
            bo_object_name     = gs_parameters-class-bo_object_name
            abap_object_name   = gs_parameters-class-abap_object_name
            class_type_abbrev  = 'BO' ).

        gr_abap_class =
          zab_abap_class_code_bo=>create_new(
            ls_create_new ).

      WHEN abap_true.

        "Interface
        ls_create_new =
          VALUE zab_abap_class_code_bo=>gts_create_new(
            prefix_name        = 'Z'
            module_abbrev      = gs_parameters-class-module_abbrev
            bo_object_name     = gs_parameters-class-bo_object_name
            abap_object_name   = gs_parameters-class-abap_object_name
            class_type_abbrev  = 'BOI' ).

        gr_abap_class_interf =
          zab_abap_class_interf_code_bo=>create_new_interface(
            ls_create_new ).

        DATA(ls_class_interf_data) = gr_abap_class_interf->get_data( ).

        me->gs_class_interf_data = gr_abap_class_interf->get_data( ).

        "Class
        ls_create_new =
          VALUE zab_abap_class_code_bo=>gts_create_new(
            prefix_name        = 'Z'
            module_abbrev      = gs_parameters-class-module_abbrev
            bo_object_name     = gs_parameters-class-bo_object_name
            abap_object_name   = gs_parameters-class-abap_object_name
            class_type_abbrev  = 'BO'
          ).

        gr_abap_class =
          zab_abap_class_code_bo=>create_new(
            ls_create_new ).

        gr_abap_class->add_interface_code(
          iv_section = zab_abap_class_code_bo=>gcc_section_public
          it_interfaces = VALUE #(
            ( ls_class_interf_data-class_name )
          ) ).

    ENDCASE.

    me->gs_class_data = gr_abap_class->get_data( ).

  ENDMETHOD.

  METHOD test_prog_main.

    "Check
    IF gs_parameters-test_program-create_ind IS INITIAL.

      RETURN.

    ENDIF.

    "Create test class
    DATA(ls_test_class_create) =
      VALUE zab_abap_class_code_bo=>gts_create_new(
        prefix_name        = 'Z'
        module_abbrev      = gs_parameters-class-module_abbrev
        bo_object_name     = gs_parameters-class-bo_object_name
        abap_object_name   = gs_parameters-class-abap_object_name && '_BO'
        class_type_abbrev  = 'TT' ).

    gr_test_class_bo =
      zab_abap_class_code_bo=>create_new(
        ls_test_class_create ).

    gr_abap_program->add_abap_class( gr_test_class_bo ).

    IF me->gs_parameters-test_program-read_call_ind = abap_true.

      "Add ALV tree view variable in Test class
      "DATA gr_alv_tree_vw TYPE REF TO zui_alv_tree_vw.
      gr_test_class_bo->add_data_code(
        iv_section   = zab_abap_class_code_bo=>gcc_section_protected
        it_data_list = VALUE #(
          (
            id           = 1
            parent_id    = 0
            name         = 'GR_ALV_TREE_VW'
            kind         = zab_abap_type_code_bo=>gcc_kind_ref
            data_type    = 'ZUI_ALV_TREE_VW'
          )
        )
      ).

    ENDIF.

    "Create test class variable in report
    DATA(lv_test_ref_var_name) =
      zab_abap_variable_name_bo=>create_by_data( VALUE #(
        name            = 'TEST_TT'
        life_time       = zab_abap_variable_name_bo=>gcc_class_life_time
        variable_kind   = zab_abap_variable_name_bo=>gcc_kind_ref
        changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
      ) )->get_variable_name( ).


    gr_abap_program->add_sel_screen_parameter(
      is_sel_screen_field = VALUE #(
        name            = 'F8'
        type_type       = 'P'
        type_name       = 'CHAR20'
        no_display_ind  = abap_false
        default_value   = |'Press F8'|
        comment         =
          |This is a dummy field, needed to create | &&
          |the selections screen 1000 for the ALV tree|
      )
    ).

    "Add global variable
    gr_abap_program->add_global_variable(
      VALUE #(
        id           = 0
        parent_id    = 0
        name         = lv_test_ref_var_name
        kind         = cl_abap_typedescr=>kind_ref
        data_type    = gr_test_class_bo->get_data( )-class_name
        comment_text = 'Test object' ) ).

    "LOAD-OF-PROGRAM.
    gr_abap_program->add_event_code(
      VALUE #(
        name      = zab_abap_program_code_bo=>gcc_load_of_program
        code_list = VALUE #(
          ( || )
          ( |  { lv_test_ref_var_name } = new #( ).| )
          ( || )
        )
      ) ).

    IF me->gs_parameters-test_program-read_call_ind = abap_true.

      "AT SELECTION-SCREEN OUTPUT.  = PBO
      gr_abap_program->add_event_code(
        VALUE #(
          name      = zab_abap_program_code_bo=>gcc_at_selection_screen_output
          code_list = VALUE #(
            ( || )
            ( |  { lv_test_ref_var_name }->pbo( ).| )
            ( || )
          )
        ) ).

      "AT SELECTION-SCREEN.  = PAI
      gr_abap_program->add_event_code(
        VALUE #(
          name      = zab_abap_program_code_bo=>gcc_at_selection_screen
          code_list = VALUE #(
            ( || )
            ( |  { lv_test_ref_var_name }->pai( ).| )
            ( || )
          )
        ) ).

    ENDIF.

    "Start of selection
    gr_abap_program->add_event_code(
      VALUE #(
        name      = zab_abap_program_code_bo=>gcc_start_of_sel_event
        code_list = VALUE #(

          ( || )
          ( |  { lv_test_ref_var_name }->execute( ).| )
        )
      ) ).

    "Create code for execute methods
    gr_test_execute_code = NEW zab_abap_code_bo( ).

    "Add Create instance call
    IF gs_parameters-test_program-instantiate_call_ind = abap_true.

      test_prog_get_instance_call( ).

    ENDIF.

    IF gs_parameters-test_program-read_call_ind = abap_true AND
       gs_parameters-class-read_ind = abap_true AND
       gs_parameters-bapis-read_bapi IS NOT INITIAL.

      test_prog_get_data_call( ).

    ENDIF.

    IF gs_parameters-test_program-create_object_call_ind = abap_true AND
       gs_parameters-class-create_ind = abap_true AND
       gs_parameters-bapis-create_bapi IS NOT INITIAL.

      test_prog_create_object_call( ).

    ENDIF.

    IF gs_parameters-test_program-update_object_call_ind = abap_true AND
       gs_parameters-class-update_ind = abap_true AND
       gs_parameters-bapis-update_bapi IS NOT INITIAL.

      test_prog_update_object_call( ).

    ENDIF.

    IF gs_parameters-test_program-non_cru_ind = abap_true AND
       gs_parameters-class-non_cru_ind = abap_true AND
       gs_parameters-bapis-non_cru_bapis_rng[] IS NOT INITIAL.

      test_prog_non_cru_object_call( ).

    ENDIF.

    "***************************************************************
    IF me->gs_parameters-test_program-read_call_ind = abap_true.

      "Add PBO method
      DATA(ls_method) =
        VALUE zab_abap_method_code_bo=>gts_data(
          type = zab_abap_method_code_bo=>gcc_instance_method_type
          name = 'PBO'
          code_list = VALUE #(
              ( |    | )
              ( |    IF gr_alv_tree_vw IS NOT INITIAL.| )
              ( |      | )
              ( |      gr_alv_tree_vw->pbo( ).| )
              ( |      | )
              ( |    ENDIF.| )
              ( |    | )
          )
        ).

      me->gr_test_class_bo->add_method_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        is_method  = ls_method ).



      "***************************************************************
      "Add PAI method
      ls_method =
        VALUE zab_abap_method_code_bo=>gts_data(
          type = zab_abap_method_code_bo=>gcc_instance_method_type
          name = 'PAI'
          code_list = VALUE #(
              ( |    | )
              ( |    IF gr_alv_tree_vw IS NOT INITIAL.| )
              ( |      | )
              ( |      gr_alv_tree_vw->pai( ).| )
              ( |      | )
              ( |    ENDIF.| )
              ( |    | )
          )
        ).

      me->gr_test_class_bo->add_method_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_public
        is_method  = ls_method ).

    ENDIF.

    "***************************************************************
    "Add EXECUTE method
    ls_method =
      VALUE zab_abap_method_code_bo=>gts_data(
        type = zab_abap_method_code_bo=>gcc_instance_method_type
        name = 'EXECUTE'
        code_list = gr_test_execute_code->get_code_lines(
          iv_code_level = 1 )
      ).

    me->gr_test_class_bo->add_method_code(
      iv_section = zab_abap_class_code_bo=>gcc_section_public
      is_method  = ls_method ).

    "***************************************************************
    "Add DISPLAY_DATA method
    IF me->gs_parameters-test_program-read_call_ind = abap_true.

      ls_method =
        VALUE zab_abap_method_code_bo=>gts_data(
          type = zab_abap_method_code_bo=>gcc_instance_method_type
          name = 'DISPLAY_DATA'
          parameters = VALUE #(
            (
              type        = zab_abap_method_code_bo=>gcc_importing_param_type
              name        = 'is_data'
              typing_code = zab_abap_method_code_bo=>gcc_type_typing_code
              data_type   = 'any'
            )
          )
          code_list = VALUE #(

            ( |     DATA(lt_flat_data) =| )
            ( |       NEW zab_deep_to_flat_data_convert( )->convert_data(| )
            ( |         iv_root_name = 'GET_DATA( )'| )
            ( |         is_data      = is_data ).| )
            ( | | )
            ( |     DATA(ls_alv_tree_meta_data) =| )
            ( |       VALUE zui_alv_tree_vw=>gts_meta_data(| )
            ( | | )
            ( |         field_catalog_config = VALUE #(| )
            ( |           type                    = zui_alv_tree_vw=>gc_fc_type_by_data| )
            ( |           structure_name   = ''| )
            ( |         )| )
            ( | | )
            ( |         hierarchy_structure = VALUE #(| )
            ( | | )
            ( |           hierarchy_type  = zui_alv_tree_vw=>parent_child_hierarchy_type| )
            ( | | )
            ( |           parent_child = VALUE #(| )
            ( |             child_key_field_name  = 'KEY'| )
            ( |             parent_key_field_name = 'PARENT_KEY'| )
            ( |             node_text_field_name  = 'NAME'| )
            ( |           )| )
            ( |         )| )
            ( | | )
            ( |         top_node = VALUE #(| )
            ( |           add_ind   = abap_true| )
            ( |           node_text = 'Flights'(200)| )
            ( |         )| )
            ( | | )
            ( |         hierarchy_header = VALUE #(| )
            ( |           heading   = 'Structures / table types / elements'(300)| )
            ( |           tooltip   = ''(400)| )
            ( |           width     = 35| )
            ( |           width_pix = '' ) ).| )
            ( | | )
            ( |     gr_alv_tree_vw = NEW #(| )
            ( |       is_meta_data = ls_alv_tree_meta_data| )
            ( |       ir_data      = REF #( lt_flat_data ) ).| )
            ( | | )
            ( |     DATA(lt_field_catalog) = gr_alv_tree_vw->get_field_catalog( ).| )
            ( | | )
            ( |     LOOP AT lt_field_catalog| )
            ( |       ASSIGNING FIELD-SYMBOL(<ls_catalog_field>).| )
            ( | | )
            ( |       CASE <ls_catalog_field>-fieldname.| )
            ( | | )
            ( |         WHEN 'LEVEL' OR 'KEY' OR 'PARENT_KEY' OR 'kind'.| )
            ( | | )
            ( |           <ls_catalog_field>-no_out = abap_true.| )
            ( | | )
            ( |         WHEN 'FIELD_NAME'.| )
            ( | | )
            ( |           <ls_catalog_field>-scrtext_s = 'Name'.| )
            ( |           <ls_catalog_field>-scrtext_m = 'Name'.| )
            ( |           <ls_catalog_field>-scrtext_l = 'Name'.| )
            ( |           <ls_catalog_field>-outputlen = 35.| )
            ( | | )
            ( |         WHEN 'INTERNAL_VALUE'.| )
            ( | | )
            ( |           <ls_catalog_field>-scrtext_s = 'Int. value'.| )
            ( |           <ls_catalog_field>-scrtext_m = 'Internal value'.| )
            ( |           <ls_catalog_field>-scrtext_l = 'Internal value'.| )
            ( |           <ls_catalog_field>-outputlen = 40.| )
            ( | | )
            ( |         WHEN 'EXTERNAL_VALUE'.| )
            ( | | )
            ( |           <ls_catalog_field>-scrtext_s = 'Ext. value'.| )
            ( |           <ls_catalog_field>-scrtext_m = 'External value'.| )
            ( |           <ls_catalog_field>-scrtext_l = 'External value'.| )
            ( |           <ls_catalog_field>-outputlen = 40.| )
            ( | | )
            ( |         WHEN 'CHECKTABLE'.| )
            ( |           <ls_catalog_field>-scrtext_s = 'Chck table'.| )
            ( |           <ls_catalog_field>-scrtext_m = 'Check table'.| )
            ( |           <ls_catalog_field>-scrtext_l = 'Check table'.| )
            ( | | )
            ( |         WHEN 'DOMAIN_FIXED_VALUE_COUNT'.| )
            ( | | )
            ( |           <ls_catalog_field>-scrtext_s = 'Fixed values count'.| )
            ( |           <ls_catalog_field>-scrtext_m = 'Domain fixed values count'.| )
            ( |           <ls_catalog_field>-scrtext_l = 'Domain fixed values count'.| )
            ( | | )
            ( |         WHEN 'DOMAIN_VALUE_TABLE'.| )
            ( |           <ls_catalog_field>-scrtext_s = 'Value table'.| )
            ( |           <ls_catalog_field>-scrtext_m = 'Domain value table'.| )
            ( |           <ls_catalog_field>-scrtext_l = 'Domain value table'.| )
            ( |           <ls_catalog_field>-reptext   = 'Domain value table'.| )
            ( | | )
            ( |         WHEN 'LENG'.| )
            ( |           <ls_catalog_field>-outputlen = 18.| )
            ( | | )
            ( |         WHEN 'OUTPUTLEN'.| )
            ( |           <ls_catalog_field>-scrtext_s = 'Output lenght'.| )
            ( |           <ls_catalog_field>-outputlen = 18.| )
            ( | | )
            ( |         WHEN 'DECIMALS'.| )
            ( |           <ls_catalog_field>-outputlen = 18.| )
            ( | | )
            ( |         WHEN 'DATATYPE'.| )
            ( |           <ls_catalog_field>-scrtext_s = 'DD type'.| )
            ( |           <ls_catalog_field>-scrtext_m = 'DD data type'.| )
            ( |           <ls_catalog_field>-scrtext_l = 'DD data type'.| )
            ( |           <ls_catalog_field>-reptext   = 'DD data type'.| )
            ( |           <ls_catalog_field>-outputlen = 18.| )
            ( | | )
            ( |         WHEN 'INTTYPE'.| )
            ( |           <ls_catalog_field>-outputlen = 18.| )
            ( | | )
            ( |         WHEN 'CONVEXIT'.| )
            ( |           <ls_catalog_field>-outputlen = 15.| )
            ( | | )
            ( |         WHEN 'LOWERCASE'.| )
            ( |           <ls_catalog_field>-outputlen = 12.| )
            ( | | )
            ( |       ENDCASE.| )
            ( | | )
            ( |     ENDLOOP.| )
            ( | | )
            ( |     gr_alv_tree_vw->set_field_catalog( lt_field_catalog ).| )
            ( | | )
            ( |     "********************************************************| )
            ( |     "Display| )
            ( |     "********************************************************| )
            ( | | )
            ( |     gr_alv_tree_vw->display( ).| )
          )
        ).

      me->gr_test_class_bo->add_method_code(
        iv_section = zab_abap_class_code_bo=>gcc_section_protected
        is_method  = ls_method ).

    ENDIF.

  ENDMETHOD.

  METHOD test_prog_add_instance_call.

    DATA(lt_key) = get_bo_key_fields( ).

    IF me->gs_parameters-class-main_db_table_name IS NOT INITIAL.

      DATA(lr_db_table_util) = zab_ddic_db_table_bo=>get_by_name( me->gs_parameters-class-main_db_table_name ).

      DATA(lt_last_record_field_values) = lr_db_table_util->get_last_record_field_values( ).

    ELSE.

      cr_code->add_code_line( |        "No BO main DB table was entered, so no key value could be read from the database.| ).

    ENDIF.

    IF lt_last_record_field_values[] IS INITIAL.

      cr_code->add_code_line( |        BREAK-POINT. "TODO: Add the key field values.| ).

    ENDIF.

    cr_code->add_code_line( |        DATA({ iv_variable_name }) =| ).

    "BO Class interface
    DATA(lv_spaces) = |          |.

    IF me->gs_parameters-class-interface_ind = abap_true.

      cr_code->add_code_line(
        |{ lv_spaces }CAST { to_lower( me->gs_class_interf_data-class_name ) }(| ).

      lv_spaces = |{ lv_spaces }  |.

    ENDIF.

    IF lines( lt_key ) = 1.

      ASSIGN lt_key[ 1 ]
        TO FIELD-SYMBOL(<ls_key>).

      READ TABLE lt_last_record_field_values
        WITH KEY field_name = <ls_key>-db_table_field_name
        ASSIGNING FIELD-SYMBOL(<ls_field_value>).

      "Set value
      IF sy-subrc = 0.

        DATA(lr_data_element_bo) =
          zab_ddic_component_type=>create_component_by_name(
              CONV #( <ls_key>-data_element_name ) ).

        DATA(lv_value) = lr_data_element_bo->get_sql_value( <ls_field_value>-value ).

      ELSE.

        lv_value = get_key_dummy_value( CONV #( <ls_key>-data_element_name ) ).

      ENDIF.

      "Ex.         material = 1
      DATA(lv_line) =
        lv_spaces &&
        to_lower( gs_class_data-class_name ) &&
        |=>| &&
        to_lower( me->gs_data_names-get_instance_method_name ) && |( | &&
        lv_value && | )|.

      cr_code->add_code_line( lv_line ).

    ELSE.

      cr_code->add_code_line( lv_spaces &&
        to_lower( gs_class_data-class_name ) &&
        |=>| &&
        me->gs_data_names-get_instance_method_name && |( | ).

      cr_code->add_code_line( |{ lv_spaces }  VALUE #(| ).

      LOOP AT lt_key
        ASSIGNING <ls_key>.

        IF <ls_key>-data_element_name IS NOT INITIAL.

          "Ex.         material = 1
          cr_code->add_code_line(
            |{ lv_spaces }    | && to_lower( <ls_key>-name ) &&
            | = | &&
            get_key_dummy_value( CONV #( <ls_key>-data_element_name ) )  ).

        ELSE.

          "
          "Ex.         material = 1
          cr_code->add_code_line(
            |*{ lv_spaces }    | && to_lower( <ls_key>-name ) &&
            | = TODO: field is not a DDIC field.|  ).

        ENDIF.

      ENDLOOP.

      cr_code->append_to_last_line( |{ lv_spaces })| ).

      cr_code->append_to_last_line( | )| ).

    ENDIF.


    IF me->gs_parameters-class-interface_ind = abap_true.

      lv_spaces = |          |.

      cr_code->add_code_line(
        |{ lv_spaces }).| ).

    ELSE.

      cr_code->append_to_last_line( |.| ).

    ENDIF.

  ENDMETHOD.

  METHOD test_prog_get_instance_call.

    DATA lt_code_list TYPE zab_abap_code_bo=>gtt_lines.

    DATA lr_code TYPE REF TO zab_abap_code_bo.

    lr_code = NEW #( ).

    lr_code->add_code_line( |  "*******************************************************************************************************| ).
    lr_code->add_code_line( |  "Get | && to_lower( gs_parameters-class-bo_object_name ) && | instance| ).
    lr_code->add_code_line( |  "*******************************************************************************************************| ).
    lr_code->add_code_line( || ).
    lr_code->add_code_line( |  TRY.| ).
    lr_code->add_code_line( || ).
    lr_code->add_code_line( |      ULINE.| ).
    lr_code->add_code_line( || ).

    DATA(lv_ref_variable_name) =
     zab_abap_variable_name_bo=>create_by_data( VALUE #(
       name            = gs_class_data-variable_name
       life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
       variable_kind   = zab_abap_variable_name_bo=>gcc_kind_ref
       changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
     ) )->get_variable_name( ).

    test_prog_add_instance_call(
      EXPORTING iv_variable_name = CONV #( lv_ref_variable_name )
      CHANGING cr_code           = lr_code ).


    DATA(lv_return_ref_name) =
     zab_abap_variable_name_bo=>create_by_data( VALUE #(
       name            = 'RETURN_EXC'
       life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
       variable_kind   = zab_abap_variable_name_bo=>gcc_kind_ref
       changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
     ) )->get_variable_name( ).

    lr_code->add_code_line( || ).
    lr_code->add_code_line( |      WRITE: / '| && to_lower( gs_parameters-class-bo_object_name ) && | instantiated. '.| ).
    lr_code->add_code_line( || ).
    lr_code->add_code_line( |    CATCH zab_return_exc INTO DATA({ lv_return_ref_name }).| ).
    lr_code->add_code_line( || ).
    lr_code->add_code_line( |      WRITE: / '| && to_lower( gs_parameters-class-bo_object_name ) && | not instantiated. Error: '.| ).
    lr_code->add_code_line( || ).
    lr_code->add_code_line( |      zab_return_exc_vw=>write_messages_to_screen( { lv_return_ref_name } ).| ).
    lr_code->add_code_line( || ).
    lr_code->add_code_line( |  ENDTRY.| ).

    "Add method
    DATA(ls_method) =
      VALUE zab_abap_method_code_bo=>gts_data(
        type = zab_abap_method_code_bo=>gcc_instance_method_type
        name = gs_data_names-get_instance_method_name
        code_list = lr_code->get_code_lines(
          iv_code_level = 1 )
      ).

    me->gr_test_class_bo->add_method_code(
      iv_section = zab_abap_class_code_bo=>gcc_section_protected
      is_method  = ls_method ).

    "Call method
    lt_code_list = VALUE #(
      ( || )
      ( |*    { to_lower( gs_data_names-get_instance_method_name ) }( ).| )
    ).

    gr_test_execute_code->add_code_lines( lt_code_list ).

  ENDMETHOD.

  METHOD test_prog_get_data_call.

    DATA lr_code TYPE REF TO zab_abap_code_bo.

    lr_code = NEW #( ).

    DATA lt_code_list TYPE zab_abap_code_bo=>gtt_lines.

    "*************************************************************************
    "First part
    "*************************************************************************
    lt_code_list = VALUE #(
      ( || )
      ( |    "*******************************************************************************************************| )
      ( |    "Get data from | && to_lower( gs_parameters-class-bo_object_name ) )
      ( |    "*******************************************************************************************************| )
      ( || )
      ( |    TRY.| )
      ( || )
    ).

    lr_code->add_code_lines( lt_code_list ).

    "*************************************************************************
    "Instance call
    "*************************************************************************

    DATA(lv_structure_name) =
      zab_abap_variable_name_bo=>create_by_data( VALUE #(
       name            = gs_class_data-abap_object_name
       life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
       variable_kind   = zab_abap_variable_name_bo=>gcc_kind_structure
       changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
     ) )->get_variable_name( ).

    DATA(lv_ref_variable_name) =
      zab_abap_variable_name_bo=>create_by_data( VALUE #(
       name            = gs_class_data-variable_name
       life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
       variable_kind   = zab_abap_variable_name_bo=>gcc_kind_ref
       changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
     ) )->get_variable_name( ).

    "Get instance
    test_prog_add_instance_call(
      EXPORTING iv_variable_name = CONV #( lv_ref_variable_name )
      CHANGING  cr_code = lr_code ).

    "*************************************************************************
    "Read part
    "*************************************************************************

    DATA(lv_return_ref_name) =
     zab_abap_variable_name_bo=>create_by_data( VALUE #(
       name            = 'RETURN_EXC'
       life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
       variable_kind   = zab_abap_variable_name_bo=>gcc_kind_ref
       changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
     ) )->get_variable_name( ).

    lt_code_list =
      VALUE #(
        ( || )
        ( |      DATA({ lv_structure_name }) = | &&
            |{ lv_ref_variable_name }->{ to_lower( gs_data_names-get_data_method_name ) }( ).| )
        ( || )
        ( |       display_data( { lv_structure_name } ).| )
        ( || )
        ( |    CATCH zab_return_exc INTO DATA({ lv_return_ref_name }).| )
        ( || )
        ( |      WRITE: / '| && gs_parameters-class-bo_object_name && | get_data has error. Error: '.| )
        ( || )
        ( |      ULINE.| )
        ( || )
        ( |      zab_return_exc_vw=>write_messages_to_screen( { lv_return_ref_name } ).| )
        ( || )
        ( |  ENDTRY.| )
        ( || )
      ).

    lr_code->add_code_lines( lt_code_list ).

    "Add method
    DATA(ls_method) =
      VALUE zab_abap_method_code_bo=>gts_data(
        type = zab_abap_method_code_bo=>gcc_instance_method_type
        name = gs_data_names-get_data_method_name
        code_list = lr_code->get_code_lines(
          iv_code_level = 1 )
      ).

    me->gr_test_class_bo->add_method_code(
      iv_section = zab_abap_class_code_bo=>gcc_section_protected
      is_method  = ls_method ).

    "Call method
    lt_code_list = VALUE #(
      ( || )
      ( |    { to_lower( gs_data_names-get_data_method_name ) }( ).| )
    ).

    gr_test_execute_code->add_code_lines( lt_code_list ).

  ENDMETHOD.

  METHOD test_prog_create_object_call.

    DATA lt_code_list TYPE zab_abap_code_bo=>gtt_lines.

    DATA(lr_code) = NEW zab_abap_code_bo( ).

    lt_code_list = VALUE #(
      ( || )
      ( |  "*******************************************************************************************************| )
      ( |  "Create { to_lower( gs_parameters-class-bo_object_name ) }| )
      ( |  "*******************************************************************************************************| )
      ( || )
      ( |    TRY.| )
      ( || )
      ( |        ULINE.| )
      ( || )
    ).

    lr_code->add_code_lines( lt_code_list ).

    DATA(lv_structure_name) =
      zab_abap_variable_name_bo=>create_by_data( VALUE #(
        name            = gs_class_data-abap_object_name && |_CREA|
        life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
        variable_kind   = zab_abap_variable_name_bo=>gcc_kind_structure
        changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
      ) )->get_variable_name( ).

    lr_code->add_code_line(
      |        "Map data| ).

    lr_code->add_code_line(
      |        DATA({ lv_structure_name }) =| ).

    lr_code->add_code_line(
      |          VALUE | && to_lower( gs_class_data-class_name ) && |=>{ me->gs_data_names-create_data_names-data_type_name }(| ).

    DATA(ls_bapi_data) = gs_references-create_bapi->get_data( ).

    DATA(lt_parameter_list) = gs_references-create_bapi->get_parameter_list( ).

    "Importing parameters
    LOOP AT lt_parameter_list
      ASSIGNING FIELD-SYMBOL(<ls_parameter>)
      WHERE type = 'I'.

      DATA(lr_abap_typedescr) = <ls_parameter>-data_element->get_type_descr( ).

      "Add parameter
      test_add_parameters(
        EXPORTING iv_name              = <ls_parameter>-name
                  ir_abap_typedescr    = lr_abap_typedescr
                  iv_deep_level        = 1
                  iv_indent_level      = 6
                  iv_out_comment_ind   = me->gs_parameters-test_program-create_data_out_comment_ind
                  iv_tables_param_ind  = abap_false
        CHANGING  cr_code              = lr_code ).

    ENDLOOP.

    DATA(lv_counter) = 0.

    "Table parameters
    LOOP AT lt_parameter_list
      ASSIGNING <ls_parameter>
      WHERE type = 'T'.

      IF zab_abap_bapi_bo=>check_is_return_variable( CONV #( <ls_parameter>-data_element_name ) ).

        CONTINUE.

      ENDIF.

      lr_abap_typedescr = <ls_parameter>-data_element->get_type_descr( ).

      "Add parameter
      test_add_parameters(
        EXPORTING iv_name              = <ls_parameter>-name
                  ir_abap_typedescr    = lr_abap_typedescr
                  iv_deep_level        = 1
                  iv_indent_level      = 6
                  iv_out_comment_ind   = me->gs_parameters-test_program-create_data_out_comment_ind
                  iv_tables_param_ind  = abap_true
        CHANGING  cr_code              = lr_code ).

    ENDLOOP.

    "End of method call
    lr_code->add_code_line( || ).

    lr_code->add_code_line( |          ).| ). "End of VALUE #

    lr_code->add_code_line( || ).

    "Method call
    DATA(lv_ref_name) =
      zab_abap_variable_name_bo=>create_by_data( VALUE #(
        name            = gs_class_data-variable_name
        life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
        variable_kind   = zab_abap_variable_name_bo=>gcc_kind_ref
        changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
      ) )->get_variable_name( ).

    lr_code->add_code_line(
      |        "Create new instance| ).

    lr_code->add_code_line(
      |        DATA({ lv_ref_name }) =| ).

    lr_code->add_code_line(
      |          | && to_lower( gs_class_data-class_name ) && |=>{ to_lower( gs_data_names-create_instance_method_name ) }(| ).

    lr_code->add_code_line(
      |            { lv_structure_name } ).| ).


    DATA(lv_return_ref_name) =
      zab_abap_variable_name_bo=>create_by_data( VALUE #(
        name            = 'RETURN_EXC'
        life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
        variable_kind   = zab_abap_variable_name_bo=>gcc_kind_ref
        changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
      ) )->get_variable_name( ).

    lt_code_list =
      VALUE #(
        ( || )
        ( |        zdb_transaction_dlo=>commit( ).| )
        ( || )
        ( |        WRITE: / '{ gs_parameters-class-bo_object_name } create completed.'.| )
        ( || )
        ( |      CATCH zab_return_exc INTO DATA({ lv_return_ref_name }).| )
        ( || )
        ( |        zdb_transaction_dlo=>rollback( ).| )
        ( || )
        ( |        WRITE: / '| && gs_parameters-class-bo_object_name && | create has error. Error: '.| )
        ( || )
        ( |        ULINE.| )
        ( || )
        ( |        zab_return_exc_vw=>write_messages_to_screen( { lv_return_ref_name } ).| )
        ( || )
        ( |    ENDTRY.| )
      ).

    lr_code->add_code_lines( lt_code_list ).

    "Add method
    DATA(ls_method) =
      VALUE zab_abap_method_code_bo=>gts_data(
        type = zab_abap_method_code_bo=>gcc_instance_method_type
        name = gs_data_names-create_instance_method_name
        code_list = lr_code->get_code_lines(
          iv_code_level = 1 )
      ).

    me->gr_test_class_bo->add_method_code(
      iv_section = zab_abap_class_code_bo=>gcc_section_protected
      is_method  = ls_method ).

    "Call method
    lt_code_list = VALUE #(
      ( || )
      ( |*    { to_lower( gs_data_names-create_instance_method_name ) }( ).| )
    ).

    gr_test_execute_code->add_code_lines( lt_code_list ).

  ENDMETHOD.

  METHOD test_prog_update_object_call.

    test_prog_update_gen_call(
      iv_method_name     = me->gs_data_names-update_data_method_name
      iv_data_type_name  = me->gs_data_names-change_data_names-data_type_name
      ir_bapi            = gs_references-update_bapi
      iv_out_comment_ind = me->gs_parameters-test_program-update_out_comment_ind
      iv_variable_name   = me->gs_data_names-change_data_names-variable_name
    ).

  ENDMETHOD.

  METHOD test_prog_update_gen_call.

    DATA(lr_code) = NEW zab_abap_code_bo( ).

    DATA lt_code_list TYPE zab_abap_code_bo=>gtt_lines.

    "*************************************************************************
    "First part
    "*************************************************************************
    lt_code_list = VALUE #(
      ( || )
      ( |  "*******************************************************************************************************| )
      ( |  "{ iv_method_name } { to_lower( gs_parameters-class-bo_object_name ) }| )
      ( |  "*******************************************************************************************************| )
      ( || )
      ( |    TRY.| )
      ( || )
      ( |        ULINE.| )
      ( || )
    ).

    lr_code->add_code_lines( lt_code_list ).

    "*************************************************************************
    "Instance call
    "*************************************************************************

    DATA(lv_ref_variable_name) =
     zab_abap_variable_name_bo=>create_by_data( VALUE #(
       name            = gs_class_data-variable_name
       life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
       variable_kind   = zab_abap_variable_name_bo=>gcc_kind_ref
       changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
     ) )->get_variable_name( ).

    test_prog_add_instance_call(
      EXPORTING iv_variable_name = CONV #( lv_ref_variable_name )
      CHANGING  cr_code = lr_code ).

    "*************************************************************************
    "Instance call
    "*************************************************************************

    DATA(lv_structure_name) =
     zab_abap_variable_name_bo=>create_by_data( VALUE #(
       name            = iv_method_name
       life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
       variable_kind   = zab_abap_variable_name_bo=>gcc_kind_structure
       changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
     ) )->get_variable_name( ).

    lr_code->add_code_line( || ).

    lr_code->add_code_line(
      |        "Map data| ).

    lr_code->add_code_line(
      |        DATA({ lv_structure_name }) =| ).

    lr_code->add_code_line(
      |          VALUE | && to_lower( gs_class_data-class_name ) && |=>{ iv_data_type_name }(| ).

    DATA(ls_bapi_data) = ir_bapi->get_data( ).

    DATA(lt_parameter_list) = ir_bapi->get_parameter_list( ).

    "*************************************************************************
    "Method message - Importing parameters
    "*************************************************************************

    LOOP AT lt_parameter_list
      ASSIGNING FIELD-SYMBOL(<ls_parameter>)
      WHERE type = 'I'.

      test_add_parameters(
        EXPORTING iv_name              = <ls_parameter>-name
                  ir_abap_typedescr    = <ls_parameter>-data_element->get_type_descr( )
                  iv_deep_level        = 1
                  iv_indent_level      = 6
                  iv_out_comment_ind   = iv_out_comment_ind
                  iv_tables_param_ind  = abap_false
        CHANGING  cr_code              = lr_code ).

    ENDLOOP.

    DATA(lv_counter) = 0.

    "*************************************************************************
    "Method message - Table parameters
    "*************************************************************************

    LOOP AT lt_parameter_list
      ASSIGNING <ls_parameter>
      WHERE type = 'T'.

      "Skip bapireturn parameters
      IF zab_abap_bapi_bo=>check_is_return_variable( CONV #( <ls_parameter>-data_element_name ) ) = abap_true.

        CONTINUE.

      ENDIF.

      DATA(lr_abap_typedescr) = <ls_parameter>-data_element->get_type_descr( ).

      "Add parameter
      test_add_parameters(
        EXPORTING iv_name              = <ls_parameter>-name
                  ir_abap_typedescr    = lr_abap_typedescr
                  iv_deep_level        = 1
                  iv_indent_level      = 6
                  iv_out_comment_ind   = iv_out_comment_ind
                  iv_tables_param_ind  = abap_true
        CHANGING  cr_code              = lr_code ).

    ENDLOOP.

    lr_code->add_code_line( || ).

    lr_code->add_code_line( |          ).| ). "End of VALUE #

    lr_code->add_code_line( || ).

    "*************************************************************************
    "Method call
    "*************************************************************************

    lr_code->add_code_line( || ).

    lr_code->add_code_line(
      |        "{ iv_method_name }| ).

    lr_code->add_code_line(
      |        { lv_ref_variable_name }->{ to_lower( iv_method_name ) }(| ).

    lr_code->add_code_line(
      |          CHANGING { iv_variable_name } = { lv_structure_name } ).| ).


    DATA(lv_return_ref_name) =
     zab_abap_variable_name_bo=>create_by_data( VALUE #(
       name            = 'RETURN_EXC'
       life_time       = zab_abap_variable_name_bo=>gcc_method_life_time
       variable_kind   = zab_abap_variable_name_bo=>gcc_kind_ref
       changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
     ) )->get_variable_name( ).

    "*************************************************************************
    "Result handling
    "*************************************************************************

    lt_code_list =
      VALUE #(
        ( || )
        ( |        zdb_transaction_dlo=>commit( ).| )
        ( || )
        ( |        WRITE: / '{ gs_parameters-class-bo_object_name } change data completed.'.| )
        ( || )
        ( |      CATCH zab_return_exc INTO DATA({ lv_return_ref_name }).| )
        ( || )
        ( |        zdb_transaction_dlo=>rollback( ).| )
        ( || )
        ( |        WRITE: / '| && gs_parameters-class-bo_object_name && | get_data has error. Error: '.| )
        ( || )
        ( |        ULINE.| )
        ( || )
        ( |        zab_return_exc_vw=>write_messages_to_screen( { lv_return_ref_name } ).| )
        ( || )
        ( |    ENDTRY.| )
      ).

    lr_code->add_code_lines( lt_code_list ).

    "Add method
    DATA(ls_method) =
      VALUE zab_abap_method_code_bo=>gts_data(
        type = zab_abap_method_code_bo=>gcc_instance_method_type
        name = iv_method_name
        code_list = lr_code->get_code_lines(
          iv_code_level = 1 )
      ).

    me->gr_test_class_bo->add_method_code(
      iv_section = zab_abap_class_code_bo=>gcc_section_protected
      is_method  = ls_method ).

    "Call method
    lt_code_list = VALUE #(
      ( || )
      ( |*    { to_lower( iv_method_name ) }( ).| )
    ).

    gr_test_execute_code->add_code_lines( lt_code_list ).

  ENDMETHOD.

  METHOD test_prog_non_cru_object_call.

    LOOP AT me->gs_parameters-bapis-non_cru_bapis_rng
      ASSIGNING FIELD-SYMBOL(<ls_bapi_rng>).

      DATA(lv_bapi_name) = <ls_bapi_rng>-low.

      "Cut the word BAPI from the function module name
      IF lv_bapi_name+0(4) = 'BAPI'.
        DATA(lv_method_name) = lv_bapi_name+5.
      ELSE.
        lv_method_name = lv_bapi_name.
      ENDIF.

      DATA(lr_bapi) = zab_abap_bapi_bo=>get_bapi_by_name(
        iv_bapi_name             = lv_bapi_name
        iv_db_table_name         = gs_parameters-class-main_db_table_name
        iv_bor_object_type_name  = gs_parameters-class-bor_object_type_name
        iv_action_type_name      = zab_abap_bapi_bo=>gcc_update_action_type_name ).

      DATA(lv_data_type_name) =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = lv_method_name
          life_time       = zab_abap_variable_name_bo=>gcc_class_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_structure
          changeable_kind = zab_abap_variable_name_bo=>gcc_type_chng_kind
        ) )->get_variable_name( ).

      DATA(lv_variable_name) =
        zab_abap_variable_name_bo=>create_by_data( VALUE #(
          name            = lv_method_name
          life_time       = zab_abap_variable_name_bo=>gcc_changing_param_life_time
          variable_kind   = zab_abap_variable_name_bo=>gcc_kind_structure
          changeable_kind = zab_abap_variable_name_bo=>gcc_variable_chng_kind
        ) )->get_variable_name( ).

      test_prog_update_gen_call(
        iv_method_name     = CONV #( lv_method_name )
        iv_data_type_name  = CONV #( lv_data_type_name )
        ir_bapi            = lr_bapi
        iv_out_comment_ind = abap_true
        iv_variable_name   = lv_variable_name ).

    ENDLOOP.

  ENDMETHOD.

  METHOD test_add_parameters.

    "Check is BAPIRETURN type
    DATA(lv_ddic_type_ind) = ir_abap_typedescr->is_ddic_type( ).

    DATA(lv_rel_name)      = ir_abap_typedescr->get_relative_name( ).

    IF lv_ddic_type_ind = abap_true AND  lv_rel_name IS NOT INITIAL.

      DATA(ls_ddic_header) = ir_abap_typedescr->get_ddic_header( ).

      DATA(lv_data_element_name) = ls_ddic_header-tabname.

      IF zab_abap_bapi_bo=>check_is_return_variable( lv_data_element_name ) = abap_true.

        RETURN.

      ENDIF.

    ELSE.

      DATA(lv_dummy) = 1.

    ENDIF.

    DATA(lv_first_char) = get_first_char( iv_out_comment_ind ).

    DATA(lv_spaces) = get_spaces( iv_indent_level ).

    cr_code->add_code_line( lv_first_char ).

    CASE ir_abap_typedescr->kind.

      WHEN cl_abap_typedescr=>kind_struct.

        IF iv_name IS NOT INITIAL.

          cr_code->add_code_line( |{ lv_first_char }{ lv_spaces }{ to_lower( iv_name ) } = VALUE #(| ).

        ELSE.

          cr_code->add_code_line( |{ lv_first_char }{ lv_spaces }(| ).

        ENDIF.

        DATA(lr_abap_structdescr) = CAST cl_abap_structdescr( ir_abap_typedescr ).

        DATA(lr_extended_tructdescr) = zab_abap_struct_descr=>create_by_struct_descr( lr_abap_structdescr ).

        DATA(lt_components) = lr_extended_tructdescr->get_all_element_type_descr( ).

        DATA lv_level TYPE i.

        lv_level = iv_indent_level + 1.

        IF iv_tables_param_ind = abap_true.

          DATA(lv_line_level) = iv_indent_level + 1.

          DATA(lv_line_spaces) = get_spaces( lv_line_level ).

          cr_code->add_code_line(
            |{ lv_first_char }{ lv_line_spaces }(| ).

        ENDIF.

        "Loop at the fields
        LOOP AT lt_components
          ASSIGNING FIELD-SYMBOL(<ls_components>).

          test_add_parameters(
            EXPORTING iv_name              = CONV #( <ls_components>-name )
                      ir_abap_typedescr    = <ls_components>-type
                      iv_deep_level        = iv_deep_level + 1
                      iv_indent_level      = iv_indent_level + 1
                      iv_out_comment_ind   = iv_out_comment_ind
                      iv_tables_param_ind  = abap_false
            CHANGING  cr_code              = cr_code ).

        ENDLOOP.

        IF iv_tables_param_ind = abap_true.

          "End row
          cr_code->add_code_line( |{ lv_line_spaces }| ).

          cr_code->add_code_line(
            |{ lv_first_char }{ lv_line_spaces })| ).

        ENDIF.

        cr_code->add_code_line( |{ lv_spaces }| ).

        cr_code->add_code_line(
          |{ lv_first_char }{ lv_spaces })| ).

      WHEN cl_abap_typedescr=>kind_elem.

        DATA(lr_abap_elemdescr) = CAST cl_abap_elemdescr( ir_abap_typedescr  ).

        "Get ddic data
        DATA ls_dd_field TYPE dfies.

        CLEAR ls_dd_field.

        DATA(lv_is_ddic_type_ind) = lr_abap_elemdescr->is_ddic_type( ).

        IF lv_is_ddic_type_ind = abap_true.

          ls_dd_field =
            lr_abap_elemdescr->get_ddic_field( ).

        ENDIF.

        IF lv_is_ddic_type_ind = abap_true.

          cr_code->add_code_line(
            |{ lv_first_char }{ lv_spaces }"| && ls_dd_field-fieldtext ).

        ELSE.

          cr_code->add_code_line(
            |{ lv_first_char }{ lv_spaces }"TODO: Check, this is not aa DDIC field| ).

        ENDIF.

        IF iv_deep_level = 1.

          DATA(lv_temp_parameter_name) = me->convert_to_struct_field_name( iv_name ).

        ELSE.

          lv_temp_parameter_name = iv_name.

        ENDIF.

        DATA(lv_parameter_name) =
          zab_abap_text_bo=>add_trailing_space(
            iv_text   = lv_temp_parameter_name
            iv_length = 30 ).

        DATA(lv_value) =
          test_get_value(
            iv_name           = CONV #( iv_name )
            ir_abap_elemdescr = lr_abap_elemdescr ).

        IF iv_name IS NOT INITIAL.

          cr_code->add_code_line(
            |{ lv_first_char }{ lv_spaces }{ to_lower( lv_parameter_name ) } = { lv_value }| ).

        ELSE.

          cr_code->add_code_line(
             |{ lv_first_char }{ lv_spaces }{ lv_value }| ).

        ENDIF.

      WHEN cl_abap_typedescr=>kind_table.

        DATA(lr_abap_tabledescr) = CAST cl_abap_tabledescr( ir_abap_typedescr  ).

        "Begin table
        cr_code->add_code_line(
          |{ lv_first_char }{ lv_spaces }{ to_lower( iv_name ) } = VALUE #(| ).

        "Begin line
        DATA(lr_line_type) = lr_abap_tabledescr->get_table_line_type( ).

        "Line
        test_add_parameters(
          EXPORTING iv_name              = ''
                    ir_abap_typedescr    = lr_line_type
                    iv_deep_level        = iv_deep_level + 1
                    iv_indent_level      = iv_indent_level + 1
                    iv_out_comment_ind   = iv_out_comment_ind
                    iv_tables_param_ind  = abap_false
          CHANGING  cr_code              = cr_code ).

        "End table
        cr_code->add_code_line( |{ lv_spaces }| ).

        cr_code->add_code_line(
          |{ lv_first_char }{ lv_spaces })| ).

      WHEN cl_abap_typedescr=>kind_class.

        cr_code->add_code_line(
          |"TODO: { lv_spaces }"{ to_lower( lv_parameter_name ) } = this is a reference variable, which is not supported by the tool. | ).

      WHEN cl_abap_typedescr=>kind_ref.

        DATA(lx_return) = zab_return_exc=>create_by_text(
          iv_message    = 'Var. &1 is a reference variables. Is not supported by this tool.'
          iv_field_name = ''
          iv_variable_1 = CONV #( iv_name ) ).

        RAISE EXCEPTION lx_return.

      WHEN OTHERS.

        "Code error
        DATA(lr_return_exc) = zab_return_exc=>create_by_text(
          iv_message    = |Data kind { ir_abap_typedescr->kind } is not supported.| ).

        RAISE EXCEPTION lr_return_exc.

    ENDCASE.

  ENDMETHOD.

  METHOD test_add_method_call_fields.

    CASE ir_abap_typedescr->kind.

      WHEN cl_abap_typedescr=>kind_struct.

        DATA(lr_abap_structdescr) = CAST cl_abap_structdescr( ir_abap_typedescr ).

        DATA(lr_extended_tructdescr) = zab_abap_struct_descr=>create_by_struct_descr( lr_abap_structdescr ).

        DATA(lt_components) = lr_extended_tructdescr->get_all_element_type_descr( ).

        IF iv_out_comment_ind = abap_true.

          DATA(lv_comment_char) = |*    \{|.

        ELSE.

          lv_comment_char = |    \{|.

        ENDIF.

        "Add description comment line
        cr_code->add_code_line( lv_comment_char ).

        "Loop at the components
        LOOP AT lt_components
          ASSIGNING FIELD-SYMBOL(<ls_component>).

          test_add_method_call_fields(
            EXPORTING iv_name            = CONV #( <ls_component>-name )
                      ir_abap_typedescr  = <ls_component>-type
                      iv_space           = iv_space
                      iv_out_comment_ind = iv_out_comment_ind
            CHANGING  cr_code            = cr_code ).

        ENDLOOP.

        IF iv_out_comment_ind = abap_true.

          lv_comment_char = |*    \}|.

        ELSE.

          lv_comment_char = |    \}|.

        ENDIF.

        "Add description comment line
        cr_code->add_code_line( lv_comment_char ).

      WHEN OTHERS.

        "Code error
        DATA(lr_return_exc) = zab_return_exc=>create_by_text(
          iv_message    = |Data type { ir_abap_typedescr->kind } is not supported.| ).

        RAISE EXCEPTION lr_return_exc.

    ENDCASE.

  ENDMETHOD.

  METHOD test_get_value.

    "Init
    DATA(lv_is_ddic_field_ind) = ir_abap_elemdescr->is_ddic_type( ).

    IF lv_is_ddic_field_ind = abap_true.

      DATA(ls_dd_field) = ir_abap_elemdescr->get_ddic_field( ).

      DATA(lv_length) = CONV i( ls_dd_field-leng ).

    ELSE.

      lv_length = ir_abap_elemdescr->length.

    ENDIF.

    DATA(lr_ddic_data_element_bo) =
      zab_ddic_data_element_bo=>get_by_descr(
        iv_name           = iv_name
        ir_abap_elemdescr = ir_abap_elemdescr ).

*    DATA(lv_length_text) =
*      |{  ls_dd_field-leng ALPHA = OUT }|.



    DATA(lv_length_text) =
      |{ lv_length }|.

    DATA(lv_value) = lr_ddic_data_element_bo->get_dummy_value( ).
    DATA(lv_value_2) =
      zab_abap_text_bo=>add_trailing_space(
        iv_text   = lv_value
        iv_length = 10 ).

    "Check table
    DATA(lv_check_table) = lr_ddic_data_element_bo->get_element_check_table( ).

    IF lv_check_table IS NOT INITIAL.

      DATA(lv_check_table_comment) =
        |, Table: | && lv_check_table.

    ELSE.

      CLEAR lv_check_table_comment.

    ENDIF.

    "Set meta data text
    IF lv_is_ddic_field_ind = abap_true.

      DATA(lv_meta_data_text) =
        |"| && ls_dd_field-inttype &&
        |, elem: | && ls_dd_field-rollname &&
        |, dom: | && ls_dd_field-domname &&
        lv_check_table_comment &&
        |, len: | && lv_length_text.

    ELSE.

      lv_meta_data_text =
        |" This is not a DDIC field.|.

    ENDIF.

    "Set value
    rv_value_text =
      lv_value_2 && | | && lv_meta_data_text.

  ENDMETHOD.

  METHOD add_local_class_lines.

    DATA(lr_abap_program) =
      zab_abap_program_code_bo=>get_instance(
        iv_program_name =  sy-repid
        iv_cache_ind    = abap_true ).

    DATA(lt_lines) =
      lr_abap_program->get_abap_class_lines( iv_class_name ).

    ir_code->add_code_lines( lt_lines ).

  ENDMETHOD.

  METHOD get_key_dummy_value.

    DATA(lr_data_element) =
      zab_ddic_component_type=>create_component_by_name( iv_data_element ).

    rv_text = lr_data_element->get_dummy_value( ).

  ENDMETHOD.

  METHOD get_first_char.

    IF iv_out_comment_ind   = abap_true.

      rv_first_char = |*|.

    ELSE.

      rv_first_char = ||.

    ENDIF.

  ENDMETHOD.

  METHOD get_spaces.

    DO iv_level TIMES.

      lv_spaces_text = lv_spaces_text && |  |.

    ENDDO.

  ENDMETHOD.

  METHOD get_abap_object_name.

    rv_abap_object_name = to_upper( iv_bo_object_name ).

    REPLACE ALL OCCURRENCES OF | | IN rv_abap_object_name WITH |_|.

    REPLACE ALL OCCURRENCES OF |.| IN rv_abap_object_name WITH |_|.

    REPLACE ALL OCCURRENCES OF |-| IN rv_abap_object_name WITH |_|.

    REPLACE ALL OCCURRENCES OF |(| IN rv_abap_object_name WITH ||.

    REPLACE ALL OCCURRENCES OF |)| IN rv_abap_object_name WITH ||.

    REPLACE ALL OCCURRENCES OF |+| IN rv_abap_object_name WITH |_|.

    REPLACE ALL OCCURRENCES OF |&| IN rv_abap_object_name WITH |_|.

    REPLACE ALL OCCURRENCES OF |/| IN rv_abap_object_name WITH |_|.

    REPLACE ALL OCCURRENCES OF |:| IN rv_abap_object_name WITH |_|.

  ENDMETHOD.

ENDCLASS.

CLASS zbo_abap_bapi_cls_ut_vw DEFINITION
  INHERITING FROM zui01_mvc_view_vw.

ENDCLASS.

CLASS zbo_abap_bapi_cls_ut_vw IMPLEMENTATION.

ENDCLASS.

*------------------------------------------------------------------------------*
* Selection screen class
*------------------------------------------------------------------------------*
CLASS zbo_abap_bapi_cls_sel_scrn_vw DEFINITION
  INHERITING FROM zui01_selection_screen_vw
  CREATE PROTECTED.

  PUBLIC SECTION.

    TYPES:
      gts_data TYPE zbo_abap_bapi_cls_gen_prc=>gts_parameters.

    CLASS-METHODS:
      instance_by_data
        IMPORTING iv_object_name TYPE gtv_mvc_object_name
        RETURNING VALUE(rr_view) TYPE REF TO zbo_abap_bapi_cls_sel_scrn_vw.

    METHODS set_data REDEFINITION.

    METHODS get_data
      RETURNING VALUE(rs_data) TYPE gts_data.

  PROTECTED SECTION.

    METHODS set_title.

    METHODS set_label_texts.

    METHODS fill_listboxes REDEFINITION.

    METHODS check_do_validate REDEFINITION.

ENDCLASS.

CLASS zbo_abap_bapi_cls_sel_scrn_vw IMPLEMENTATION.

  METHOD instance_by_data.

    rr_view = NEW #(
      VALUE #(
        object_name = iv_object_name

        select_options_restrictions = VALUE sscr_restrict(
          opt_list_tab = VALUE sscr_opt_list_tab(
            (
              name    = 'EQ_ONLY'         "Options list name
              options = VALUE #(
                eq      = abap_true
              )
            )
          )

          ass_tab      = VALUE sscr_ass_tab(
            (
              kind        = 'S'           "A(ll), B(lock), S(elect-Option)
              name        = 'S_B_ACTN'    "SELECT-OPTION field name
              sg_main     = 'I'           "Main SiGn: I = only include, SPACE = both  / * Both Include and Exclude options
              sg_addy     = space         "Additional SiGn
              op_main     = 'EQ_ONLY'     "Main selection screen - options list name
              op_addy     = ''            "Additional multiple selection screen - options list name
            )
          )
        )
      ) ).

  ENDMETHOD.

  METHOD set_data.

    FIELD-SYMBOLS <ls_data> TYPE gts_data.
    ASSIGN gr_data_object_ref->*
      TO <ls_data>.

    IF is_data <> <ls_data>.

      DATA(lr_struct_descr) = CAST cl_abap_structdescr( cl_abap_typedescr=>describe_by_data_ref( gr_data_object_ref ) ).

      DATA lr_old_data TYPE REF TO data.
      FIELD-SYMBOLS <ls_old_data> TYPE gts_data.
      CREATE DATA lr_old_data TYPE HANDLE lr_struct_descr.
      ASSIGN lr_old_data->* TO <ls_old_data>.

      <ls_old_data> = <ls_data>.
      DATA(ls_new_data) = CONV gts_data( is_data ).

      <ls_data> = is_data.

      "Read BAPI
      IF <ls_old_data>-bapis-read_bapi <> ls_new_data-bapis-read_bapi.

        <ls_data>-class-read_ind = COND #(
          WHEN ls_new_data-bapis-read_bapi IS NOT INITIAL
            THEN abap_true
          ELSE
            abap_false ).

        <ls_data>-test_program-read_call_ind = <ls_data>-class-read_ind.

      ENDIF.

      "Create BAPI
      IF <ls_old_data>-bapis-create_bapi <> ls_new_data-bapis-create_bapi.

        <ls_data>-class-create_ind = COND #(
          WHEN ls_new_data-bapis-create_bapi IS NOT INITIAL
            THEN abap_true
          ELSE
            abap_false ).

        <ls_data>-test_program-create_object_call_ind      = <ls_data>-class-create_ind.
        <ls_data>-test_program-create_data_out_comment_ind = <ls_data>-class-create_ind.

      ENDIF.

      "Update BAPI
      IF <ls_old_data>-bapis-update_bapi <> ls_new_data-bapis-update_bapi.

        <ls_data>-class-update_ind = COND #(
          WHEN ls_new_data-bapis-update_bapi IS NOT INITIAL
            THEN abap_true
          ELSE
            abap_false ).

        <ls_data>-test_program-update_object_call_ind = <ls_data>-class-update_ind.
        <ls_data>-test_program-update_out_comment_ind = <ls_data>-class-update_ind.

      ENDIF.

      gv_view_changed       = iv_view_changed.
      gv_controller_changed = iv_controller_changed.

    ENDIF.

  ENDMETHOD.

  METHOD get_data.

    ASSIGN me->gr_data_object_ref->*
      TO FIELD-SYMBOL(<ls_data>).

    rs_data = <ls_data>.

  ENDMETHOD.



  METHOD fill_listboxes.

    DATA(_value_list) =
      zab_abap_naming_bo=>get_naming_list( ).

    CALL FUNCTION 'VRM_SET_VALUES'
      EXPORTING
        id     = 'P_ABNAMG'
        values = _value_list.

  ENDMETHOD.

  METHOD check_do_validate.

    rv_validate_ind = abap_true.

    IF iv_command_code = 'asdfa'.

      rv_validate_ind = abap_false.

    ENDIF.

  ENDMETHOD.


  METHOD set_title.

    sy-title = 'ABAP BAPI BO class generator'.

  ENDMETHOD.

  METHOD set_label_texts.

  ENDMETHOD.

ENDCLASS.

CLASS zui_alv_tree_vw DEFINITION.

  PUBLIC SECTION.

    TYPES:

      "****************************************************
      "Hierarchy
      "****************************************************
      gtv_hierarchy_type            TYPE c LENGTH 15,
      gtv_field_catalog_config_type TYPE c LENGTH 15,

      BEGIN OF gts_grouping_field,
        field_name TYPE fieldname,
      END OF gts_grouping_field,
      gtt_grouping_fields TYPE STANDARD TABLE OF gts_grouping_field WITH DEFAULT KEY,

      BEGIN OF gts_grouping_hierarchy,
        node_field_name TYPE feldname,
        grouping_fields TYPE gtt_grouping_fields,
      END OF gts_grouping_hierarchy,

      BEGIN OF gts_parent_child_hierarchy,
        child_key_field_name  TYPE fieldname,
        parent_key_field_name TYPE fieldname,
        node_text_field_name  TYPE fieldname,
      END OF gts_parent_child_hierarchy,

      BEGIN OF gts_field_catalog_config,
        type           TYPE gtv_field_catalog_config_type,
        structure_name TYPE strukname,
        field_catalog  TYPE lvc_t_fcat,
      END OF gts_field_catalog_config,

      BEGIN OF gts_hierarchy_structure,
        hierarchy_type     TYPE gtv_hierarchy_type,
        grouping_hierarchy TYPE gts_grouping_hierarchy,
        parent_child       TYPE gts_parent_child_hierarchy,
      END OF gts_hierarchy_structure,

      BEGIN OF gts_top_node_meta_data,
        add_ind   TYPE abap_bool,
        node_text TYPE lvc_value,
      END OF gts_top_node_meta_data,

      BEGIN OF gts_meta_data,
        field_catalog_config TYPE gts_field_catalog_config,

        hierarchy_header     TYPE treev_hhdr,
        hierarchy_structure  TYPE gts_hierarchy_structure,
        top_node             TYPE gts_top_node_meta_data,

      END OF gts_meta_data.

    CONSTANTS:
      grouping_hierarchy_type     TYPE gtv_hierarchy_type VALUE 'GROUPING',
      parent_child_hierarchy_type TYPE gtv_hierarchy_type VALUE 'PARENT_CHILD',

      gc_fc_type_by_structure     TYPE gtv_field_catalog_config_type VALUE 'BY STRUCTURE',
      gc_fc_type_by_catalog       TYPE gtv_field_catalog_config_type VALUE 'BY CATALOG',
      gc_fc_type_by_data          TYPE gtv_field_catalog_config_type VALUE 'BY_DATA'.

    METHODS:
      constructor
        IMPORTING
          is_meta_data TYPE gts_meta_data
          ir_data      TYPE REF TO data,
      get_field_catalog
        RETURNING VALUE(rt_field_catalog) TYPE lvc_t_fcat,
      set_field_catalog
        IMPORTING it_field_catalog TYPE lvc_t_fcat,
      set_data_object_ref
        IMPORTING ir_data TYPE REF TO data,
      scroll_to_top_node,
      display,
      pbo,
      pai.

  PROTECTED SECTION.

    TYPES:
      BEGIN OF gts_node_key_mapping,
        table_key  TYPE string,
        node_key   TYPE lvc_nkey,
        hidden_ind TYPE abap_bool,
      END OF gts_node_key_mapping,
      gtt_node_key_mappings TYPE STANDARD TABLE OF gts_node_key_mapping.

    DATA gt_node_key_mappings TYPE gtt_node_key_mappings.

    "*************************************************
    "Methods
    "*************************************************

    METHODS:
      init_tree
        RAISING zab_return_exc,
      exit_program,
      register_events
        RAISING zab_return_exc,
      create_hierarchy
        RAISING zab_return_exc,
      create_hierarchy_grouping,
      create_hierarchy_parent_child
        RAISING zab_return_exc,
      create_toolbar,
      do_filter
        RAISING zab_return_exc,
      do_filter_apply_filter
        RAISING zab_return_exc,
      undo_filter
        RAISING zab_return_exc.

    METHODS on_node_double_click FOR EVENT node_double_click OF cl_gui_alv_tree
      IMPORTING node_key
                  sender.

    "*************************************************
    "Event methods
    "*************************************************

    METHODS on_toolbar_function_selected FOR EVENT function_selected OF cl_gui_toolbar
      IMPORTING
          fcode.

    METHODS on_toolbar_dropdown_clicked  FOR EVENT dropdown_clicked  OF cl_gui_toolbar
      IMPORTING
          fcode
          posx
          posy.

    "*************************************************
    "Data
    "*************************************************

    DATA: gs_meta_data       TYPE gts_meta_data.

    DATA: gr_data            TYPE REF TO data.

    DATA: gr_alv_tree         TYPE REF TO cl_gui_alv_tree.

    DATA: gr_alv_tree_data TYPE REF TO data,
          gt_fieldcatalog  TYPE lvc_t_fcat.

    TYPES:
      BEGIN OF gts_filter,
        field_name TYPE fieldname,
        value      TYPE spop-varvalue1,
      END OF gts_filter,
      gtt_filter TYPE STANDARD TABLE OF gts_filter WITH DEFAULT KEY.

    DATA  gt_filter        TYPE gtt_filter.

    DATA:
      ok_code LIKE sy-ucomm,
      save_ok LIKE sy-ucomm.           "OK-Code

ENDCLASS.

CLASS zui_alv_tree_vw IMPLEMENTATION.

  "*********************************************************
  "Example grouping
*    DATA(ls_alv_tree_meta_data) =
*    VALUE zui_alv_tree_vw=>gts_meta_data(
*
*      output_structure_name   = 'SFLIGHT'
*
*      node_field_name         = 'FLDATE'
*
*      hierarchy_structure = value #(
*        hierarchy_type  = zui_alv_tree_vw=>grouping_hierarchy_type
*        grouping_fields = VALUE #(
*          (
*            field_name = 'YEAR_MONTH'
*          )
*          (
*            field_name = 'CARRID'
*          )
*        )
*      )
*
*      top_node = VALUE #(
*        add_ind   = abap_true
*        node_text = 'Flights'(200)
*      )
*
*      hierarchy_header = VALUE #(
*        heading = 'Totals/Month/Carrier/Date'(300)
*        tooltip = 'Flights in a month'(400)
*        width = 35
*        width_pix = '' )
*
*    ).

  "*********************************************************
  "Example parent child hierarchy

*          DATA(ls_alv_tree_meta_data) =
*          VALUE zui_alv_tree_vw=>gts_meta_data(
*
*            field_catalog_config = VALUE #(
*              type                    = zui_alv_tree_vw=>gc_fc_type_by_data
*
*              structure_name   = ''       "  "If field cat. type = gc_fc_type_by_structure
*
*            )
*
*            hierarchy_structure = VALUE #(
*
*              hierarchy_type  = zui_alv_tree_vw=>parent_child_hierarchy_type
*
*              parent_child = VALUE #(
*                child_key_field_name  = 'KEY'
*                parent_key_field_name = 'PARENT_KEY'
*                node_text_field_name  = 'NAME'
*              )
*            )
*
*            top_node = VALUE #(
*              add_ind   = abap_true
*              node_text = 'Flights'(200)
*            )
*
*            hierarchy_header = VALUE #(
*              heading = 'Structures / table types / elements'(300)
*              tooltip = ''(400)
*              width = 35
*              width_pix = '' ) ).
  "*********************************************************

  METHOD constructor.

    gs_meta_data = is_meta_data.

    gr_data      = ir_data.

    get_field_catalog( ).

  ENDMETHOD.

  METHOD get_field_catalog.

    TRY.

        IF gt_fieldcatalog[] IS INITIAL.

          "Field catalog
          CASE gs_meta_data-field_catalog_config-type.

            WHEN gc_fc_type_by_structure.

              CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
                EXPORTING
                  i_structure_name = gs_meta_data-field_catalog_config-structure_name
                CHANGING
                  ct_fieldcat      = gt_fieldcatalog.

            WHEN gc_fc_type_by_catalog.

              gt_fieldcatalog[] = gs_meta_data-field_catalog_config-field_catalog[].

            WHEN gc_fc_type_by_data.

              IF me->gr_data IS INITIAL.

                DATA(lr_return_exc) =
                  zab_return_exc=>create_by_text(
                    |Field catalog should be create on data, but there is no data yet.| ).

                RAISE EXCEPTION lr_return_exc.

              ENDIF.

              DATA(lr_type_descr) =
                cl_abap_typedescr=>describe_by_data_ref(
                  EXPORTING
                    p_data_ref = gr_data
*              exceptions
*                reference_is_initial = 1
*                others               = 2
                     ).

              IF sy-subrc <> 0.

                lr_return_exc =
                  zab_return_exc=>create_by_text(
                    'Cannot describe data. Problem in Field catalog'  ).

                RAISE EXCEPTION lr_return_exc.

              ENDIF.

              IF lr_type_descr->kind <> cl_abap_typedescr=>kind_table.

                lr_return_exc =
                  zab_return_exc=>create_by_text(
                    'Data must be an internal table.' ).

                RAISE EXCEPTION lr_return_exc.

              ENDIF.

              DATA(lr_table_descr) = CAST cl_abap_tabledescr( lr_type_descr ).

              DATA(lr_line_descr) = lr_table_descr->get_table_line_type( ).

              IF lr_line_descr->kind <> cl_abap_typedescr=>kind_struct.

                lr_return_exc =
                  zab_return_exc=>create_by_text(
                    'The line type of the internal table must be a structure' ).

                RAISE EXCEPTION lr_return_exc.

              ENDIF.

              DATA(lr_struct_descr) = CAST cl_abap_structdescr( lr_line_descr ).

              DATA(lr_extend_struct_descr) = zab_abap_struct_descr=>create_by_struct_descr( lr_struct_descr ).

              gt_fieldcatalog = lr_extend_struct_descr->get_all_element_field_cat( ).

          ENDCASE.

        ENDIF.

        IF rt_field_catalog IS REQUESTED.

          rt_field_catalog = gt_fieldcatalog.

        ENDIF.

      CATCH zab_return_exc INTO DATA(lr_return_exc_2).

        zab_return_exc_vw=>display_system_message( lr_return_exc_2 ).

    ENDTRY.

  ENDMETHOD.

  METHOD set_field_catalog.

    gt_fieldcatalog = it_field_catalog.

  ENDMETHOD.

  METHOD set_data_object_ref.

    gr_data = ir_data.

  ENDMETHOD.

  METHOD scroll_to_top_node.

    gr_alv_tree->get_first_child(
      EXPORTING i_node_key = cl_alv_tree_base=>c_virtual_root_node
      IMPORTING e_child_node_key = DATA(lv_child_node_key) ).

    CHECK lv_child_node_key IS NOT INITIAL.

    gr_alv_tree->set_top_node( lv_child_node_key ).

  ENDMETHOD.

  METHOD display.

    CALL SELECTION-SCREEN 1000.

  ENDMETHOD.

  METHOD pbo.

    TRY.

        SET PF-STATUS 'MAIN100'.
        SET TITLEBAR 'MAINTITLE'.

        IF gr_alv_tree IS INITIAL.

          init_tree( ).

          CALL METHOD cl_gui_cfw=>flush
            EXCEPTIONS
              cntl_system_error = 1
              cntl_error        = 2.

          IF sy-subrc NE 0.

            CALL FUNCTION 'POPUP_TO_INFORM'
              EXPORTING
                titel = 'Automation Queue failure'(801)
                txt1  = 'Internal error:'(802)
                txt2  = 'A method in the automation queue'(803)
                txt3  = 'caused a failure.'(804).

          ENDIF.

        ENDIF.

      CATCH zab_return_exc INTO DATA(lr_return_exc).

        zab_return_exc_vw=>display_system_message( lr_return_exc ).

    ENDTRY.

  ENDMETHOD.

  METHOD pai.

    save_ok = ok_code.
    CLEAR ok_code.

    CASE save_ok.

      WHEN 'EXIT' OR 'BACK' OR 'CANC'.
        exit_program( ).

      WHEN OTHERS.
* §5. Call dispatch to process toolbar functions
* Toolbar events are registered in constructur method of
* CL_ALV_TREE_BASE as application events. So the dispatch call
* is a must if you want to use the standard toolbar.
        cl_gui_cfw=>dispatch( ).

    ENDCASE.

    CALL METHOD cl_gui_cfw=>flush.

  ENDMETHOD.

*&---------------------------------------------------------------------*
*&      METHOD  init_tree
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
  METHOD init_tree.

    "Create tree control
    CREATE OBJECT gr_alv_tree
      EXPORTING
        parent                      = cl_gui_container=>screen0
        node_selection_mode         = cl_gui_column_tree=>node_sel_mode_single
        item_selection              = 'X'
        no_html_header              = 'X'
        no_toolbar                  = ''
      EXCEPTIONS
        cntl_error                  = 1
        cntl_system_error           = 2
        create_error                = 3
        lifetime_error              = 4
        illegal_node_selection_mode = 5
        failed                      = 6
        illegal_column_name         = 7.
    IF sy-subrc <> 0.

      DATA(lr_return_exc) =
        zab_return_exc=>create_by_text(
          |Error { sy-msgno } in ALV tree constructor.| ).

      RAISE EXCEPTION lr_return_exc.

    ENDIF.

    DATA lr_table_descr TYPE REF TO cl_abap_tabledescr.

    lr_table_descr ?=
      cl_abap_tabledescr=>describe_by_data_ref( gr_data ).
*      EXCEPTIONS
*        reference_is_initial = 1
*        others               = 2
    .
    IF sy-subrc <> 0.
*     Implement suitable error handling here
    ENDIF.

    "Create internal table
    CREATE DATA gr_alv_tree_data
       TYPE HANDLE lr_table_descr.

    FIELD-SYMBOLS <lt_table> TYPE ANY TABLE.

    ASSIGN gr_alv_tree_data->* TO <lt_table>.


* IMPORTANT: Table 'gt_alv_tree_sflight' must be empty. Do not change this table
* (even after this method call). You can change data of your table
* by calling methods of CL_GUI_ALV_TREE.
* Furthermore, the output table 'gt_outtab' must be global and can
* only be used for one ALV Tree Control.
    gr_alv_tree->set_table_for_first_display(
      EXPORTING
        is_hierarchy_header = gs_meta_data-hierarchy_header
      CHANGING
        it_fieldcatalog     = gt_fieldcatalog
        it_outtab           = <lt_table> ). "table must be empty !

    create_hierarchy( ).

    create_toolbar( ).

    register_events( ).
* Update calculations which were initially defined by field DO_SUM
* of the fieldcatalog. (see build_fieldcatalog).

    gr_alv_tree->update_calculations( ).

* Send data to frontend.
    gr_alv_tree->frontend_update( ).

    scroll_to_top_node( ).

  ENDMETHOD.
  " init_tree
*&---------------------------------------------------------------------*
*&      METHOD  build_hierarchy_header
*&---------------------------------------------------------------------*
*&      METHOD  exit_program
*&---------------------------------------------------------------------*
*       free object and leave program
*----------------------------------------------------------------------*
  METHOD exit_program.

    cl_gui_container=>screen0->free( ).

    LEAVE PROGRAM.

  ENDMETHOD.                               " exit_program

*-----------------------------------------------------------------------
  METHOD register_events.
*§4. Event registration: tell ALV Tree which events shall be passed
*    from frontend to backend.
    DATA: lt_events TYPE cntl_simple_events,
          l_event   TYPE cntl_simple_event.

*§4a. Frontend registration(i):  get already registered tree events.
*................................................................
* The following four tree events registers ALV Tree in the constructor
* method itself.
*    - cl_gui_column_tree=>eventid_expand_no_children
* (needed to load data to frontend when a user expands a node)
*    - cl_gui_column_tree=>eventid_header_context_men_req
* (needed for header context menu)
*    - cl_gui_column_tree=>eventid_header_click
* (allows selection of columns (only when item selection activated))
*   - cl_gui_column_tree=>eventid_item_keypress
* (needed for F1-Help (only when item selection activated))
*
* Nevertheless you have to provide their IDs again if you register
* additional events with SET_REGISTERED_EVENTS (see below).
* To do so, call first method  GET_REGISTERED_EVENTS (this way,
* all already registered events remain registered, even your own):

    gr_alv_tree->get_registered_events(
      IMPORTING
        events = lt_events ).

* (If you do not these events will be deregistered!!!).
* You do not have to register events of the toolbar again.

*§4b. Frontend registration(ii): add additional event ids
    l_event-eventid = cl_gui_column_tree=>eventid_node_double_click.
    APPEND l_event TO lt_events.

*§4c. Frontend registration(iii):provide new event table to alv tree
    CALL METHOD gr_alv_tree->set_registered_events
      EXPORTING
        events                    = lt_events
      EXCEPTIONS
        cntl_error                = 1
        cntl_system_error         = 2
        illegal_event_combination = 3.
    IF sy-subrc <> 0.

      DATA(lr_return_exc) =
        zab_return_exc=>create_by_text(
          |Error { sy-msgno } in method gr_alv_tree->set_registered_events.| ).

      RAISE EXCEPTION lr_return_exc.

    ENDIF.
*--------------------
*§4d. Register events on backend (ABAP Objects event handling)
    SET HANDLER on_node_double_click
      FOR gr_alv_tree.

  ENDMETHOD.                               " register_events
*&---------------------------------------------------------------------*
*&      METHOD  create_hierarchy
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
  METHOD create_hierarchy.

    CASE me->gs_meta_data-hierarchy_structure-hierarchy_type.

      WHEN grouping_hierarchy_type.

        create_hierarchy_grouping( ).

      WHEN parent_child_hierarchy_type.

        create_hierarchy_parent_child( ).

      WHEN OTHERS.

        DATA(lr_return_exc) =
          zab_return_exc=>create_by_text(
            |The hierarchy type '| && me->gs_meta_data-hierarchy_structure-hierarchy_type && | does not exist.| ).

        RAISE EXCEPTION lr_return_exc.

    ENDCASE.

  ENDMETHOD.

  METHOD create_hierarchy_grouping.

    DATA:
      l_node_key TYPE lvc_nkey,
      l_top_key  TYPE lvc_nkey.

    TYPES:
      BEGIN OF lts_group_field_value,
        node_key TYPE lvc_nkey,
        value    TYPE lvc_value,
      END OF lts_group_field_value.

    DATA: lt_grouping_field_values TYPE STANDARD TABLE OF lts_group_field_value WITH DEFAULT KEY.


    " Define one top node. In this way it is possible to calculate
    " values for the whole hierarchy.
    IF gs_meta_data-top_node-add_ind = abap_true.

      gr_alv_tree->add_node(
        EXPORTING
          i_relat_node_key = ''
          i_relationship   = cl_gui_column_tree=>relat_last_child
          i_node_text      = gs_meta_data-top_node-node_text
        IMPORTING
          e_new_node_key   =  l_node_key ).

      APPEND INITIAL LINE TO lt_grouping_field_values
        ASSIGNING FIELD-SYMBOL(<lv_grouping_field_value>).

      <lv_grouping_field_value>-node_key = l_node_key.
      <lv_grouping_field_value>-value    = gs_meta_data-top_node-node_text.

    ENDIF.

    FIELD-SYMBOLS <lt_data> TYPE ANY TABLE.

    ASSIGN gr_data->* TO <lt_data>.

    LOOP AT <lt_data>
      ASSIGNING FIELD-SYMBOL(<ls_record>).

      DATA(lv_data_tabix) = sy-tabix.

      LOOP AT gs_meta_data-hierarchy_structure-grouping_hierarchy-grouping_fields
        ASSIGNING FIELD-SYMBOL(<ls_grouping_field>).

        DATA(lv_grouping_field_index) = sy-tabix.

        "Skip top node
        IF gs_meta_data-top_node-add_ind = abap_true.

          lv_grouping_field_index = lv_grouping_field_index + 1.

        ENDIF.

        ASSIGN COMPONENT <ls_grouping_field>-field_name
          OF STRUCTURE <ls_record>
          TO FIELD-SYMBOL(<lv_value>).

        IF lv_data_tabix = 1.

          APPEND INITIAL LINE TO lt_grouping_field_values
            ASSIGNING <lv_grouping_field_value>.

          <lv_grouping_field_value> = <lv_value>.

          DATA(lv_match_ind) = abap_false.

        ELSE.

          READ TABLE lt_grouping_field_values
            INDEX lv_grouping_field_index
            ASSIGNING <lv_grouping_field_value>.

          IF <lv_grouping_field_value>-value = <lv_value>.

            lv_match_ind = abap_true.

          ELSE.

            lv_match_ind = abap_false.

          ENDIF.

        ENDIF.

        IF lv_match_ind = abap_true.

          CONTINUE.

        ENDIF.

        "Get parent key
        DATA lv_parent_node_key TYPE lvc_nkey.

        IF lv_grouping_field_index > 1.

          READ TABLE lt_grouping_field_values
            INDEX lv_grouping_field_index - 1
            ASSIGNING FIELD-SYMBOL(<lv_parent_grp_field_value>).

          lv_parent_node_key = <lv_parent_grp_field_value>-node_key.

        ELSE.

          CLEAR lv_parent_node_key.

        ENDIF.

        "Add node
        DATA lv_node_text	TYPE lvc_value.

        WRITE <lv_value> TO lv_node_text.

        gr_alv_tree->add_node(
          EXPORTING
            i_relat_node_key = lv_parent_node_key
            i_relationship   = cl_gui_column_tree=>relat_last_child
            i_node_text      = lv_node_text
            is_outtab_line   = <ls_record>
          IMPORTING
            e_new_node_key   = DATA(lv_node_key) ).

        "Set group field values
        <lv_grouping_field_value>-value    = <lv_value>.
        <lv_grouping_field_value>-node_key = lv_node_key.

      ENDLOOP.

      "Add complete line
      ASSIGN COMPONENT gs_meta_data-hierarchy_structure-grouping_hierarchy-node_field_name
        OF STRUCTURE <ls_record>
        TO <lv_value>.

      WRITE <lv_value> TO lv_node_text.

      gr_alv_tree->add_node(
        EXPORTING
          i_relat_node_key = <lv_grouping_field_value>-node_key
          i_relationship   = cl_gui_column_tree=>relat_last_child
          is_outtab_line   = <ls_record>
          i_node_text      = lv_node_text
        IMPORTING
          e_new_node_key   = lv_node_key ).

    ENDLOOP.

  ENDMETHOD.                               " create_hierarchy

  METHOD create_hierarchy_parent_child.

    REFRESH gt_node_key_mappings.

    DATA:
      lv_child_key       TYPE lvc_nkey,
      lv_parent_node_key TYPE lvc_nkey,
      lv_node_text       TYPE lvc_value.

    FIELD-SYMBOLS <lt_data> TYPE ANY TABLE.

    ASSIGN gr_data->* TO <lt_data>.

    LOOP AT <lt_data>
      ASSIGNING FIELD-SYMBOL(<ls_record>).

      ASSIGN COMPONENT me->gs_meta_data-hierarchy_structure-parent_child-child_key_field_name
        OF STRUCTURE <ls_record>
        TO FIELD-SYMBOL(<lv_child_key>).

      CLEAR lv_parent_node_key.

      ASSIGN COMPONENT me->gs_meta_data-hierarchy_structure-parent_child-parent_key_field_name
        OF STRUCTURE <ls_record>
        TO FIELD-SYMBOL(<lv_parent_key>).

      IF <lv_parent_key> IS NOT INITIAL.

        READ TABLE gt_node_key_mappings
          ASSIGNING FIELD-SYMBOL(<ls_parent_node_key_mapping>)
          WITH KEY table_key = <lv_parent_key>.

        IF sy-subrc <> 0.

          DATA(lr_return_exc) =
            zab_return_exc=>create_by_text(
              |Parent key | && <lv_parent_key> && | does not exist.| ).

          RAISE EXCEPTION lr_return_exc.

        ENDIF.

        lv_parent_node_key = <ls_parent_node_key_mapping>-node_key.

      ENDIF.

      ASSIGN COMPONENT me->gs_meta_data-hierarchy_structure-parent_child-node_text_field_name
        OF STRUCTURE <ls_record>
        TO FIELD-SYMBOL(<lv_value>).

      lv_node_text = <lv_value>.

      gr_alv_tree->add_node(
        EXPORTING
          i_relat_node_key = lv_parent_node_key
          i_relationship   = cl_gui_column_tree=>relat_last_child
          i_node_text      = lv_node_text
          is_outtab_line   = <ls_record>
*          IS_NODE_LAYOUT   = value #(
*           expander          = abap_true )
        IMPORTING
          e_new_node_key   = DATA(lv_node_key) ).



      APPEND INITIAL LINE TO gt_node_key_mappings
        ASSIGNING FIELD-SYMBOL(<ls_node_key_mapping>).

      <ls_node_key_mapping>-table_key = <lv_child_key>.
      <ls_node_key_mapping>-node_key  = lv_node_key.

    ENDLOOP.

*************************************
*Expand all nodes
    DATA:
      lt_keys    TYPE lvc_t_nkey.

    LOOP AT <lt_data>
      ASSIGNING <ls_record>.

      ASSIGN COMPONENT me->gs_meta_data-hierarchy_structure-parent_child-child_key_field_name
        OF STRUCTURE <ls_record>
        TO FIELD-SYMBOL(<lv_key>).


      READ TABLE gt_node_key_mappings
        WITH KEY table_key = <lv_key>
        ASSIGNING <ls_node_key_mapping>.

      CALL METHOD gr_alv_tree->get_first_child
        EXPORTING
          i_node_key       = <ls_node_key_mapping>-node_key
        IMPORTING
          e_child_node_key = DATA(lv_child_node_key).

      IF lv_child_node_key IS NOT INITIAL.

        APPEND <lv_key> TO lt_keys.

      ENDIF.

    ENDLOOP.

    CALL METHOD gr_alv_tree->expand_nodes( it_node_key = lt_keys ).

  ENDMETHOD.

  METHOD create_toolbar.

    "Get toolbar control
    gr_alv_tree->get_toolbar_object(
            IMPORTING
                er_toolbar = DATA(lr_toolbar) ).

    CHECK NOT lr_toolbar IS INITIAL.

    "Add seperator to toolbar
    lr_toolbar->add_button(
            EXPORTING
                fcode     = ''
                icon      = ''
                butn_type = cntb_btype_sep
                text      = ''
                quickinfo = 'This is a Seperator' ).        "#EC NOTEXT


*    "Add Dropdown Button to toolbar (for Insert Line)
*    lr_toolbar->add_button(
*      EXPORTING
*        fcode     = 'INSERT_LC'         "Function code of button
*        icon      = '@17@'              "Icon ID (see )
*        butn_type = cntb_btype_dropdown "Button type
*        text      = ''                  "Button text
*        quickinfo = 'Insert Line' ).      "Quick info text

    "Add Dropdown Button to toolbar (for Insert Line)
    lr_toolbar->add_button(
      EXPORTING
        fcode     = 'FILTER'            "Function code of button
        icon      = '@4G@'              "Icon ID
        butn_type = cntb_btype_button   "Button type
        text      = 'Filter'            "Button text
        quickinfo = 'Select 1 cell to filter' ).    "Quick info text

    "Add Dropdown Button to toolbar (for Insert Line)
    lr_toolbar->add_button(
      EXPORTING
        fcode     = 'UNDO_FILTER'       "Function code of button
        icon      = '@GD@'              "Icon ID
        butn_type = cntb_btype_button   "Button type
        text      = 'Undo filter'       "Button text
        quickinfo = '' ).               "Quick info text

    SET HANDLER on_toolbar_function_selected  FOR lr_toolbar.

    SET HANDLER on_toolbar_dropdown_clicked   FOR lr_toolbar.

  ENDMETHOD.


  METHOD on_node_double_click.

    DATA: lt_children TYPE lvc_t_nkey.

    "Get children
    sender->get_children(
      EXPORTING
        i_node_key  = node_key
      IMPORTING
        et_children = lt_children ).

    IF NOT lt_children IS INITIAL.

      "Expand node
      sender->expand_node(
        EXPORTING
          i_node_key    = node_key
          i_level_count = 2 ).

    ENDIF.

  ENDMETHOD.

  METHOD do_filter.

    gr_alv_tree->get_selected_columns(
      IMPORTING et_sel_columns = DATA(lt_sel_columns) ).

    DATA(lv_column_lines) = lines( lt_sel_columns ).

    IF lv_column_lines > 0.

      LOOP AT lt_sel_columns
        ASSIGNING FIELD-SYMBOL(<ls_sel_column>).

        READ TABLE me->gt_fieldcatalog
          WITH KEY fieldname = <ls_sel_column>
          ASSIGNING FIELD-SYMBOL(<ls_catalog_field>).

        IF sy-subrc <> 0.

          MESSAGE |Column | && <ls_sel_column> && | not found.|
            TYPE 'W'.

          RETURN.

        ENDIF.

        DATA lv_answer TYPE c LENGTH 1.
        DATA lv_value1 TYPE spop-varvalue1.

*        "Get current value
*        READ TABLE gt_filter
*          WITH KEY field_name = <ls_catalog_field>-fieldname
*          ASSIGNING FIELD-SYMBOL(<ls_filter>).
*
*        IF sy-subrc = 0.
*
*          lv_value1 = <ls_filter>-value.
*
*        ENDIF.

        CALL FUNCTION 'POPUP_TO_GET_ONE_VALUE'
          EXPORTING
            textline1   = |Set filter for: | && <ls_catalog_field>-scrtext_l
*           TEXTLINE2   = ' '
*           TEXTLINE3   = ' '
            titel       = |Simple filter for: | && <ls_catalog_field>-scrtext_l
            valuelength = <ls_catalog_field>-outputlen
          IMPORTING
            answer      = lv_answer
            value1      = lv_value1.

        IF lv_answer <> 'J'.

          RETURN.

        ENDIF.

        DATA lt_filter LIKE gt_filter.

        APPEND INITIAL LINE TO lt_filter
          ASSIGNING FIELD-SYMBOL(<ls_filter>).

        <ls_filter>-field_name = <ls_catalog_field>-fieldname.
        <ls_filter>-value      = lv_value1.

        CLEAR lv_value1.

      ENDLOOP.

    ELSE.
      "Filter on cell

      MESSAGE 'Select one or more columns'
        TYPE 'I'.

      RETURN.

    ENDIF.

    gt_filter[] = lt_filter[].

    REFRESH lt_filter.

    "******************************************************************
    " Apply filter
    "******************************************************************

    LOOP AT me->gt_node_key_mappings
        ASSIGNING FIELD-SYMBOL(<ls_node_key_mapping>).

      <ls_node_key_mapping>-hidden_ind = abap_true.

    ENDLOOP.

    FIELD-SYMBOLS <lt_data> TYPE ANY TABLE.

    ASSIGN gr_data->* TO <lt_data>.

    LOOP AT <lt_data>
      ASSIGNING FIELD-SYMBOL(<ls_record>).

      DATA(lv_filter_ind) = abap_true.

      LOOP AT gt_filter
        ASSIGNING <ls_filter>.

        ASSIGN COMPONENT <ls_filter>-field_name
          OF STRUCTURE <ls_record>
          TO FIELD-SYMBOL(<lv_filter_field_value>).

        DATA lv_value TYPE string.

        lv_value = <lv_filter_field_value>.

        lv_value = to_upper( lv_value ).

        IF <ls_filter>-value CA '*'.

          IF lv_value CP <ls_filter>-value.
          ELSE.

            lv_filter_ind = abap_false.
            EXIT.

          ENDIF.

        ELSE.

          IF  <ls_filter>-value = lv_value.
          ELSE.

            lv_filter_ind = abap_false.
            EXIT.

          ENDIF.

        ENDIF.

      ENDLOOP.

      IF lv_filter_ind = abap_false.

        CONTINUE.

      ENDIF.

      "Make parents visible
      DATA(lv_stop) = abap_false.

      ASSIGN <ls_record> TO FIELD-SYMBOL(<ls_current_record>).

      WHILE lv_stop = abap_false.

        ASSIGN COMPONENT gs_meta_data-hierarchy_structure-parent_child-child_key_field_name
          OF STRUCTURE <ls_current_record>
          TO FIELD-SYMBOL(<lv_key_value>).

        READ TABLE me->gt_node_key_mappings
            ASSIGNING <ls_node_key_mapping>
            WITH KEY table_key = <lv_key_value>.

        <ls_node_key_mapping>-hidden_ind = abap_false.

        ASSIGN COMPONENT me->gs_meta_data-hierarchy_structure-parent_child-parent_key_field_name
          OF STRUCTURE <ls_current_record>
          TO FIELD-SYMBOL(<lv_parent_key_value>).

        IF <lv_parent_key_value> IS INITIAL.

          EXIT.

        ENDIF.

        READ TABLE <lt_data>
          ASSIGNING <ls_current_record>
          WITH KEY (me->gs_meta_data-hierarchy_structure-parent_child-child_key_field_name) = <lv_parent_key_value>.

        IF sy-subrc <> 0.

          "Code error
          DATA(lr_return_exc) = zab_return_exc=>create_by_text(
            iv_message    = |Field { me->gs_meta_data-hierarchy_structure-parent_child-child_key_field_name } value { <lv_parent_key_value> } not found.| ).

          RAISE EXCEPTION lr_return_exc.

        ENDIF.

      ENDWHILE.


    ENDLOOP.

    "Set filter
    do_filter_apply_filter( ).

  ENDMETHOD.

  METHOD undo_filter.

    LOOP AT me->gt_node_key_mappings
      ASSIGNING FIELD-SYMBOL(<ls_node_key_mapping>).

      <ls_node_key_mapping>-hidden_ind = abap_false.

    ENDLOOP.

    "Set filter
    do_filter_apply_filter( ).

  ENDMETHOD.

  METHOD do_filter_apply_filter.

    LOOP AT me->gt_node_key_mappings
        ASSIGNING FIELD-SYMBOL(<ls_node_key_mapping>).

      DATA lr_table_descr TYPE REF TO cl_abap_tabledescr.

      lr_table_descr ?=
        cl_abap_tabledescr=>describe_by_data_ref( gr_data ).

      DATA(lr_type_descr) = lr_table_descr->get_table_line_type( ).

      DATA(lr_structure_type) = CAST cl_abap_structdescr( lr_type_descr ).

      "Create internal table
      DATA lr_structure_data TYPE REF TO data.
      CREATE DATA lr_structure_data
         TYPE HANDLE lr_structure_type.

      ASSIGN lr_structure_data->*
        TO FIELD-SYMBOL(<ls_structure_data>).
*
      gr_alv_tree->get_outtab_line(
        EXPORTING
          i_node_key      = <ls_node_key_mapping>-node_key
        IMPORTING
          e_outtab_line   = <ls_structure_data>
          e_node_text     = DATA(lv_node_text2)
          et_item_layout  = DATA(lt_item_layout)
          es_node_layout  = DATA(ls_node_layout) ).

      DATA ls_node_layout_new TYPE lvc_s_lacn.

      IF <ls_node_key_mapping>-hidden_ind = abap_true.

        IF ls_node_layout-hidden = abap_true.
          CONTINUE.
        ENDIF.

        ls_node_layout_new-hidden = abap_true.

      ELSE.

        IF ls_node_layout-hidden = abap_false.
          CONTINUE.
        ENDIF.

        ls_node_layout_new-hidden = abap_false.

      ENDIF.

      ls_node_layout_new-u_hidden = abap_true.

      gr_alv_tree->change_node(
         EXPORTING
           i_node_key     = <ls_node_key_mapping>-node_key
           i_outtab_line  = <ls_structure_data>
           is_node_layout = ls_node_layout_new
*        it_item_layout =
*        i_node_text    =
*        i_u_node_text  =
         EXCEPTIONS
           node_not_found = 1
           OTHERS         = 2
               ).
      IF sy-subrc <> 0.

        DATA(lr_return_exc) =
          zab_return_exc=>create_by_text(
            |Changing the node was nog succeeded.| ).

        RAISE EXCEPTION lr_return_exc.

      ENDIF.

    ENDLOOP.

    gr_alv_tree->frontend_update( ).

  ENDMETHOD.

  METHOD on_toolbar_function_selected.

    TRY.

        CASE fcode.

          WHEN 'FILTER'.

            do_filter( ).

          WHEN 'UNDO_FILTER'.

            undo_filter( ).

        ENDCASE.

      CATCH zab_return_exc INTO DATA(lr_return_exc).

        zab_return_exc_vw=>display_system_mess_as_warning( lr_return_exc ).

    ENDTRY.

  ENDMETHOD.

  METHOD on_toolbar_dropdown_clicked.

  ENDMETHOD.

ENDCLASS.

CLASS zui01_text_edit_vw DEFINITION
  INHERITING FROM zui01_mvc_view_vw
  CREATE PROTECTED.

  PUBLIC SECTION.

    TYPES:
      BEGIN OF gts_data,
        text TYPE string,
      END OF gts_data.

    CONSTANTS:
      gcc_close_action TYPE gtv_action_name VALUE 'CLOSE',
      gcc_back_action  TYPE gtv_action_name VALUE 'BACK'.

    CLASS-METHODS:
      create_in_default_container
        IMPORTING iv_mvc_object_name     TYPE gtv_mvc_object_name
        RETURNING VALUE(rr_text_edit_vw) TYPE REF TO zui01_text_edit_vw.

    METHODS:
      init,
      set_data_2
        IMPORTING is_data TYPE gts_data,
      show REDEFINITION,
      close,
      pbo,
      pai.

    EVENTS:
      on_new_data
        EXPORTING VALUE(gs_data) TYPE gts_data,
      on_action
        EXPORTING VALUE(ev_action) TYPE gtv_action_name.

  PROTECTED SECTION.

    DATA:
      gs_data                  TYPE gts_data,

      gr_gui_container         TYPE REF TO cl_gui_container,
      gr_text_editor           TYPE REF TO cl_gui_textedit,

      gr_text_editor_container TYPE REF TO cl_gui_custom_container,

      gv_repid                 LIKE sy-repid.

    CONSTANTS: c_line_length TYPE i VALUE 256.

    DATA gv_default_container_ind TYPE abap_bool.

ENDCLASS.

CLASS zui01_text_edit_vw IMPLEMENTATION.

  METHOD create_in_default_container.

    rr_text_edit_vw = NEW #(
      iv_object_name = iv_mvc_object_name ).

    rr_text_edit_vw->gr_gui_container = cl_gui_container=>screen0.

    rr_text_edit_vw->gv_default_container_ind = abap_true.

  ENDMETHOD.

  METHOD set_data_2.

    gs_data = is_data.

  ENDMETHOD.

  METHOD init.

  ENDMETHOD.

  METHOD show.

    IF gv_default_container_ind = abap_true.

      "Create text editor
      IF gr_text_editor IS INITIAL.

        gv_repid = sy-repid.

        gr_gui_container = cl_gui_container=>screen0.

        CREATE OBJECT gr_text_editor
          EXPORTING
            parent                     = gr_gui_container
            wordwrap_mode              = cl_gui_textedit=>wordwrap_at_fixed_position
            wordwrap_position          = 200
            wordwrap_to_linebreak_mode = cl_gui_textedit=>true
          EXCEPTIONS
            OTHERS                     = 1.

      ENDIF.

      "Set text
      gr_text_editor->set_textstream( gs_data-text  ).

      IF sy-subrc NE 0.

        CALL FUNCTION 'POPUP_TO_INFORM'
          EXPORTING
            titel = gv_repid
            txt2  = space
            txt1  = 'Set text editor text stream failed'(001).

      ENDIF.

      "Set focus
      IF iv_focus_ind = abap_true.

        gr_text_editor->set_focus( gr_text_editor ).

      ENDIF.

      gr_text_editor->get_line_count(
        IMPORTING lines = DATA(line_count) ).

      gr_text_editor->select_lines(
        to_line = line_count ).

      "Call screen
      CALL SELECTION-SCREEN 1000.

    ELSE.

      "Code error
      DATA(lr_return_exc) = zab_return_exc=>create_by_text(
        iv_message    = |Without default container is not yet supported.| ).

      RAISE EXCEPTION lr_return_exc.

    ENDIF.

  ENDMETHOD.

  METHOD close.

    "Destroy text editor control
    IF NOT gr_text_editor IS INITIAL.

      CALL METHOD gr_text_editor->free
        EXCEPTIONS
          OTHERS = 1.

      IF sy-subrc NE 0.
        CALL FUNCTION 'POPUP_TO_INFORM'
          EXPORTING
            titel = gv_repid
            txt2  = space
            txt1  = 'Free text editor failed'(005).
      ENDIF.

      "Free ABAP object also
      FREE gr_text_editor.

    ENDIF.

    "Destroy container
    IF NOT gr_text_editor_container IS INITIAL.

      CALL METHOD gr_text_editor_container->free
        EXCEPTIONS
          OTHERS = 1.

      IF sy-subrc <> 0.
        "No error handling
      ENDIF.

      "Free ABAP object also
      FREE gr_text_editor_container.

    ENDIF.

    "Finally flush
    CALL METHOD cl_gui_cfw=>flush
      EXCEPTIONS
        OTHERS = 1.

    IF sy-subrc NE 0.
      CALL FUNCTION 'POPUP_TO_INFORM'
        EXPORTING
          titel = gv_repid
          txt2  = space
          txt1  = 'Flush cl_gui_cfw failed'(002).
    ENDIF.

  ENDMETHOD.

  METHOD pbo.

    IF gr_text_editor IS INITIAL.

      init( ).

    ENDIF.                               " Editor is initial

* remember: there is an automatic flush at the end of PBO!

  ENDMETHOD.

  METHOD pai.

    DATA lv_action TYPE gtv_action_name.

    CASE sy-ucomm.

      WHEN 'EXIT'.

        lv_action = gcc_close_action.

      WHEN 'BACK'.

        lv_action = gcc_back_action.

    ENDCASE.

    RAISE EVENT on_action
      EXPORTING ev_action = lv_action.

  ENDMETHOD.

ENDCLASS.



*-----------------------------------------------------------------------------*
* Selection screen
*-----------------------------------------------------------------------------*

*------------------------------------------------------------------------------*
* Toolbar buttons
SELECTION-SCREEN FUNCTION KEY 1.

SELECTION-SCREEN FUNCTION KEY 2. "Unit test

*------------------------------------------------------------------------------*
* BAPIs
SELECTION-SCREEN BEGIN OF BLOCK bapi
  WITH FRAME
  TITLE tx_bapi.

PARAMETERS:
  p_bcreat TYPE rs38l_fnam,    "BAPI create
  p_bread  TYPE rs38l_fnam,    "BAPI read
  p_bupdt  TYPE rs38l_fnam.    "BAPI update

SELECT-OPTIONS
  s_b_actn  FOR p_bupdt NO INTERVALS VISIBLE LENGTH 80.

SELECTION-SCREEN END OF BLOCK bapi.

*------------------------------------------------------------------------------*
* Business object class
SELECTION-SCREEN BEGIN OF BLOCK classnm
  WITH FRAME
  TITLE tx_class.

PARAMETERS:
  p_modnm  TYPE zbo_abap_bapi_cls_sel_scrn_vw=>gts_data-class-module_abbrev,
  p_objnm  TYPE zbo_abap_bapi_cls_sel_scrn_vw=>gts_data-class-bo_object_name,
  p_abpnm  TYPE zbo_abap_bapi_cls_sel_scrn_vw=>gts_data-class-abap_object_name,
  p_abnamg TYPE zab_abap_naming_bo=>gtv_naming_name AS LISTBOX VISIBLE LENGTH 40,
  p_tabnm  TYPE zbo_abap_bapi_cls_sel_scrn_vw=>gts_data-class-main_db_table_name,
  p_bornm  TYPE zbo_abap_bapi_cls_sel_scrn_vw=>gts_data-class-bor_object_type_name,
  cb_intf  AS CHECKBOX DEFAULT 'X'.   "Generate class interface

SELECTION-SCREEN BEGIN OF BLOCK class2 WITH FRAME TITLE class2_t.
PARAMETERS:
  cb_okey  AS CHECKBOX DEFAULT '',   "Key and get_instance method
  cb_ocrea AS CHECKBOX DEFAULT '',   "Create method
  cb_oread AS CHECKBOX DEFAULT '',   "Read method (Get detail BAPI)
  cb_oupdt AS CHECKBOX DEFAULT '',   "Change method
  cb_oncru AS CHECKBOX DEFAULT ''.   "Non-CRU methods
SELECTION-SCREEN END OF BLOCK class2.

SELECTION-SCREEN END OF BLOCK classnm.

*------------------------------------------------------------------------------*
* Business Object framework
SELECTION-SCREEN BEGIN OF BLOCK frmw
  WITH FRAME
  TITLE tx_frmw.

PARAMETERS:
  cb_exccl AS CHECKBOX DEFAULT 'X',   "Add exception class (ZBA_RETURN_EXC)
  p_dbtran AS CHECKBOX DEFAULT 'X'.   "Database transaction class

SELECTION-SCREEN END OF BLOCK frmw.

*------------------------------------------------------------------------------*
* Test code
SELECTION-SCREEN BEGIN OF BLOCK test1
  WITH FRAME
  TITLE tx_test.

PARAMETERS:
  cb_test  AS CHECKBOX DEFAULT 'X' USER-COMMAND cb_test_prog.   "Create test program

SELECTION-SCREEN BEGIN OF BLOCK test2 WITH FRAME TITLE test2_t.
PARAMETERS:
  cb_tinst AS CHECKBOX DEFAULT ' ',                         "Instantiate call
  cb_tcrea AS CHECKBOX DEFAULT ' ' USER-COMMAND cb_tcrea,   "Create object call
  cb_tcrdt AS CHECKBOX DEFAULT ' ',                         "Create out comment data call
  cb_tread AS CHECKBOX DEFAULT ' ',                         "Get data call
  cb_tupdt AS CHECKBOX DEFAULT ' ' USER-COMMAND cb_tupdt,   "Change object call
  cb_tupd2 AS CHECKBOX DEFAULT ' ',                         "Change out comment data
  cb_tncru AS CHECKBOX DEFAULT ' ' USER-COMMAND cb_tncru.   "Non-CRU method class

SELECTION-SCREEN END OF BLOCK test2.

SELECTION-SCREEN BEGIN OF BLOCK test3 WITH FRAME TITLE test3_t.

PARAMETERS:
  p_textbo AS CHECKBOX DEFAULT 'X',   "Text BO class
  p_strucd AS CHECKBOX DEFAULT 'X',   "ABAP Structure descr. class
  p_strcvw AS CHECKBOX DEFAULT 'X',   "Deep structure view class
  p_treevw AS CHECKBOX DEFAULT 'X',   "ALV Tree view class
  cb_excvw AS CHECKBOX DEFAULT 'X'.   "Add excep class VIEW (ZBA_RETURN_EXC_VW)

SELECTION-SCREEN END OF BLOCK test3.

SELECTION-SCREEN END OF BLOCK test1.

CLASS zbo_abap_bapi_cls_unit_test DEFINITION.

  PUBLIC SECTION.

    METHODS execute.

  PROTECTED SECTION.

    CONSTANTS gcc_max_count TYPE i VALUE 50.

ENDCLASS.

CLASS zbo_abap_bapi_cls_unit_test IMPLEMENTATION.

  METHOD execute.

    DATA lv_answer TYPE c LENGTH 1.

    CALL FUNCTION 'POPUP_TO_CONFIRM'
      EXPORTING
*       TITLEBAR              = ' '
*       DIAGNOSE_OBJECT       = ' '
        text_question         = 'Unittest with or without generating BO class interface?'
        text_button_1         = 'Without'
*       ICON_BUTTON_1         = ' '
        text_button_2         = 'With'
*       ICON_BUTTON_2         = ' '
        default_button        = '2'
        display_cancel_button = 'X'
*       USERDEFINED_F1_HELP   = ' '
*       START_COLUMN          = 25
*       START_ROW             = 6
*       POPUP_TYPE            =
*       IV_QUICKINFO_BUTTON_1 = ' '
*       IV_QUICKINFO_BUTTON_2 = ' '
      IMPORTING
        answer                = lv_answer.

    CASE lv_answer.

      WHEN 'A'.

        RETURN.

      WHEN '1'.

        DATA(lv_class_interface_ind) = abap_true.

      WHEN '2'.

        lv_class_interface_ind = abap_false.

    ENDCASE.


    CALL FUNCTION 'POPUP_TO_CONFIRM'
      EXPORTING
*       TITLEBAR              = ' '
*       DIAGNOSE_OBJECT       = ' '
        text_question         = |Only the first { gcc_max_count } test cases?|
        text_button_1         = |{ gcc_max_count }|
*       ICON_BUTTON_1         = ' '
        text_button_2         = 'All'
*       ICON_BUTTON_2         = ' '
        default_button        = '2'
        display_cancel_button = 'X'
*       USERDEFINED_F1_HELP   = ' '
*       START_COLUMN          = 25
*       START_ROW             = 6
*       POPUP_TYPE            =
*       IV_QUICKINFO_BUTTON_1 = ' '
*       IV_QUICKINFO_BUTTON_2 = ' '
      IMPORTING
        answer                = lv_answer.

    CASE lv_answer.

      WHEN 'A'.

        RETURN.

      WHEN '1'.

        DATA(lv_limited_set_ind) = abap_true.

      WHEN '2'.

        lv_limited_set_ind = abap_false.

    ENDCASE.

    DATA lv_ok_count TYPE i.
    DATA lv_nok_count TYPE i.

    "Read business objects
    DATA(lr_bo_list) = NEW zbo_business_object_list_vw( ).

    DATA(lt_bo_list) = lr_bo_list->read_bo_list( ).

    DATA(lv_start_time) = sy-uzeit.

    IF lv_limited_set_ind = abap_true.
      DATA(lv_bo_count) = gcc_max_count.
    ELSE.
      lv_bo_count = lines( lt_bo_list ).
    ENDIF.

    DATA(lr_progress_bar) =
      zui01_progress_bar_vw=>create(
        VALUE #(
          text                = ''
          max_value           = lv_bo_count
          show_value_ind      = abap_true
          show_max_value_ind  = abap_true
          show_percentage_ind = abap_true
        ) ).

    "Loop at the BO list
    LOOP AT lt_bo_list
      ASSIGNING FIELD-SYMBOL(<ls_bo>).

      TRY.

          IF lv_limited_set_ind = abap_true.
            IF sy-tabix > gcc_max_count.
              EXIT.
            ENDIF.
          ENDIF.

          "Set progress indicator
          lr_progress_bar->set_value( sy-tabix ).

          "-------------------------------------------------------------------------------
          "Generate the code
          "-------------------------------------------------------------------------------

          "Map data
          DATA(ls_data) =
           VALUE zbo_abap_bapi_cls_sel_scrn_vw=>gts_data(
            bapis = VALUE #(
              read_bapi                     = <ls_bo>-read_fm
              create_bapi                   = <ls_bo>-create_fm
              update_bapi                   = <ls_bo>-update_fm )
            class = VALUE #(
              module_abbrev                 = 'TT'
              bo_object_name                = <ls_bo>-short_description
              abap_object_name              = '' "Will be filled by methode GET_CORRECTED_PARAMETERS
              main_db_table_name            = <ls_bo>-main_db_table
              bor_object_type_name          = <ls_bo>-name
              key_ind                       = abap_true
              interface_ind                 = lv_class_interface_ind

              read_ind                      = abap_true
              create_ind                    = abap_true
              update_ind                    = abap_true )
            test_program = VALUE #(
              create_ind                    = abap_true
              instantiate_call_ind          = abap_true
              read_call_ind                 = abap_true

              create_object_call_ind        = abap_true
              create_data_out_comment_ind   = abap_false

              update_object_call_ind        = abap_true
              update_out_comment_ind        = abap_false

              text_bo_ind                   = abap_true
              abap_struct_descr_ind         = abap_true
              deep_struct_vw_ind            = abap_true
              alv_tree_vw_ind               = abap_true
              db_transaction_ind            = abap_true )
            bo_frame_work = VALUE #(
              exception_class_ind           = abap_true
              excep_class_view_ind          = abap_true )
              naming = VALUE #(
              naming_name                   = zab_abap_naming_bo=>get_current_naming_name( ) )
            ).

          "Generate the code
          DATA(lr_generator) =
            zbo_abap_bapi_cls_gen_prc=>create(
              ls_data ).

          DATA(ls_corrected_parameters) = lr_generator->get_corrected_parameters( ls_data ).

          ls_data = ls_corrected_parameters-parameters.

          lr_progress_bar->add_text( 'Generate code' ).

          DATA(lv_abap_code_text) = lr_generator->start( ).

          lr_progress_bar->add_text( '' ).

          "If no code, than error

          IF lv_abap_code_text = ''.

            DATA(lx_return) = zab_return_exc=>create_by_text(
              iv_message    = 'No code generated.'
              iv_field_name = 'DATA-CLASS-MAIN_DB_TABLE_NAME'
              iv_variable_1 = CONV #( ls_data-class-main_db_table_name ) ).

            RAISE EXCEPTION lx_return.

          ENDIF.

          "-------------------------------------------------------------------------------
          "Init ABAP program
          "-------------------------------------------------------------------------------

          DATA lv_program_name TYPE progname .
          lv_program_name = |ZZZ{ lv_answer }_BAPI_BO_CLASS_UNIT_TEST|.

          DATA lv_abap_line TYPE c LENGTH 255.
          CONSTANTS lv_line_length TYPE i VALUE 100.
*          data lv_abap_line type rssource-line.
          DATA: lt_abap_code LIKE TABLE OF lv_abap_line.

          "-------------------------------------------------------------------------------
          "Delete old ABAP program
          "-------------------------------------------------------------------------------

          READ REPORT lv_program_name
            INTO lt_abap_code.

          IF sy-subrc = 0.

*            read table lt_abaP_code
*              index 1
*              ASSIGNING FIELD-SYMBOL(<lv_line>).
*
*            data(lv_length) = strlen( <lv_line> ).


            DELETE REPORT lv_program_name.

            COMMIT WORK.

          ENDIF.

          "-------------------------------------------------------------------------------
          "Convert ABAP code
          "-------------------------------------------------------------------------------

          REFRESH lt_abap_code.

          "Convert string to table
          NEW zab_abap_string_converter( )->convert_to_table(
            EXPORTING
              iv_source_string      = lv_abap_code_text
              iv_target_line_length = lv_line_length
            CHANGING
              ct_target_table       =  lt_abap_code ).

          LOOP AT lt_abap_code
          ASSIGNING FIELD-SYMBOL(<ls_abap_line>).

            DATA(lv_new_lin) = |\n|.
            DATA(lv_cr) = cl_abap_char_utilities=>cr_lf.

            REPLACE lv_new_lin WITH lv_cr INTO <ls_abap_line>.

          ENDLOOP.

          "-------------------------------------------------------------------------------
          "Create the ABAP program
          "-------------------------------------------------------------------------------

          lr_progress_bar->add_text( 'Save program' ).

          INSERT REPORT lv_program_name
          FROM lt_abap_code.

          IF sy-subrc <> 0.

            lx_return = zab_return_exc=>create_by_text(
            iv_message    = 'Report not created.'
            iv_field_name = 'DATA-CLASS-MAIN_DB_TABLE_NAME'
            iv_variable_1 = CONV #( ls_data-class-main_db_table_name ) ).

            RAISE EXCEPTION lx_return.

          ENDIF.

          COMMIT WORK.

          "-------------------------------------------------------------------------------
          "Activate the code
          "-------------------------------------------------------------------------------
          lr_progress_bar->add_text( 'Activate program' ).

          DATA lv_error_message TYPE string.

          GENERATE REPORT lv_program_name
            MESSAGE lv_error_message.

          IF sy-subrc <> 0.

            lx_return = zab_return_exc=>create_by_text(
            iv_message    = 'Report not activated.' && lv_error_message
            iv_field_name = 'DATA-CLASS-MAIN_DB_TABLE_NAME'
            iv_variable_1 = CONV #( ls_data-class-main_db_table_name ) ).

            RAISE EXCEPTION lx_return.

          ENDIF.

          lr_progress_bar->add_text( '' ).

          "Delete report
          "DELETE REPORT lv_program_name.
          "COMMIT WORK.

          "Execute report
          "SUBMIT (lv_program_name ) AND RETURN.

          "Handle result
          DATA(lv_result) = 'OK.'.

          lv_ok_count = lv_ok_count + 1.

          DATA(lv_error) = ||.

        CATCH zab_return_exc INTO DATA(lr_return_exc).

          lv_result = 'NOK'.

          lv_nok_count = lv_nok_count + 1.

          lv_error = |  Error: | && lr_return_exc->get_text( ).

      ENDTRY.

      IF lv_result = 'NOK'.

        ULINE.

        WRITE:
        lv_result,
        <ls_bo>-id,
        ls_data-class-abap_object_name,
        <ls_bo>-source,
        <ls_bo>-name,
        <ls_bo>-short_description,
        <ls_bo>-read_fm,
        <ls_bo>-create_fm,
        <ls_bo>-update_fm,
        <ls_bo>-main_db_table,
        <ls_bo>-key_fields,
        lv_error.

      ENDIF.

    ENDLOOP.

    DATA(lv_end_time) = sy-uzeit.

    ULINE.
    WRITE: / 'OK : ', lv_ok_count.
    WRITE: / 'NOK: ', lv_nok_count.

    DATA(lv_total) = lv_ok_count + lv_nok_count.

    WRITE: / 'Tot: ', lv_total.

    ULINE.

    WRITE: / 'Start time: ', lv_start_time.
    WRITE: / 'End time  : ', lv_end_time.

  ENDMETHOD.

ENDCLASS.

CLASS zbo_abap_bapi_cls_gen_main_ctl DEFINITION
  INHERITING FROM zui01_selection_screen_ctl.

  PUBLIC SECTION.

    CONSTANTS:
      gcc_start_action  TYPE gtv_action_name VALUE 'start'.

    METHODS:
      constructor
        IMPORTING iv_mvc_object_name TYPE gtv_mvc_object_name,

      get_selection_screen_vw
        IMPORTING iv_dynpro_screen_no           TYPE scradnum
        RETURNING VALUE(rr_selection_screen_vw) TYPE REF TO zui01_selection_screen_vw.

  PROTECTED SECTION.

    CONSTANTS:
      gcc_sel_screen_view_name TYPE gtv_mvc_object_name VALUE 'DEFAULT_SELECTION_SCREEN',
      gcc_text_edit_view_name  TYPE gtv_mvc_object_name VALUE 'TEXT EDIT'.

    TYPES:
      gts_data               TYPE zbo_abap_bapi_cls_gen_prc=>gts_parameters.

    DATA:
*      gr_selection_screen_view TYPE REF TO lcl_selection_screen_view.
      gs_data                TYPE gts_data,
      gs_screen_data         TYPE gts_data,

      gr_selection_screen_vw TYPE REF TO zbo_abap_bapi_cls_sel_scrn_vw,

      gr_text_edit_vw        TYPE REF TO zui01_text_edit_vw,

      gr_unit_test_list_vw   TYPE REF TO zbo_abap_bapi_cls_ut_vw.

    METHODS:
      create_sel_screen_mapping
        RAISING zab_return_exc,
      get_report_event_view_vw REDEFINITION,

      execute_action REDEFINITION,

      bo_list_show_popup
        RAISING zab_return_exc,

      generate_abap_code
        RAISING zab_return_exc,

      unit_test_execute.

    METHODS
      validate
        IMPORTING iv_raise_exception_ind TYPE abap_bool DEFAULT abap_true
        RAISING   zab_return_exc.

    METHODS:
      bo_list_set_dependend_fields.

ENDCLASS.

CLASS zbo_abap_bapi_cls_gen_main_ctl IMPLEMENTATION.

  METHOD constructor.

    super->constructor( iv_mvc_object_name ).

    gr_selection_screen_vw =
      zbo_abap_bapi_cls_sel_scrn_vw=>instance_by_data(
        iv_object_name = gcc_sel_screen_view_name ).

    SET HANDLER on_action
      FOR gr_selection_screen_vw.

    gr_current_view = gr_selection_screen_vw.

  ENDMETHOD.

  METHOD create_sel_screen_mapping.

    DATA(lt_mapping_field_list) = VALUE zui01_selection_screen_vw=>gtt_mapping_field_list(
      ( key =   10  parent_key =    0 kind = 'S' data_component_name = 'BAPIS'                         screen_field_name = ''         )
      ( key =   20  parent_key =   10 kind = 'E' data_component_name = 'READ_BAPI'                     screen_field_name = 'P_BREAD'  )
      ( key =   30  parent_key =   10 kind = 'E' data_component_name = 'CREATE_BAPI'                   screen_field_name = 'P_BCREAT' )
      ( key =   40  parent_key =   10 kind = 'E' data_component_name = 'UPDATE_BAPI'                   screen_field_name = 'P_BUPDT'  )
      ( key =   50  parent_key =   10 kind = 'T' data_component_name = 'NON_CRU_BAPIS_RNG'             screen_field_name = 'S_B_ACTN'  )

      ( key =  110  parent_key =    0 kind = 'S' data_component_name = 'CLASS'                         screen_field_name = ''         )
      ( key =  120  parent_key =  110 kind = 'E' data_component_name = 'MODULE_ABBREV'                 screen_field_name = 'P_MODNM'  )
      ( key =  130  parent_key =  110 kind = 'E' data_component_name = 'BO_OBJECT_NAME'                screen_field_name = 'P_OBJNM'  )
      ( key =  140  parent_key =  110 kind = 'E' data_component_name = 'ABAP_OBJECT_NAME'              screen_field_name = 'P_ABPNM'  )
      ( key =  140  parent_key =  110 kind = 'E' data_component_name = 'MAIN_DB_TABLE_NAME'            screen_field_name = 'P_TABNM'  )
      ( key =  150  parent_key =  110 kind = 'E' data_component_name = 'BOR_OBJECT_TYPE_NAME'          screen_field_name = 'P_BORNM'  )
      ( key =  160  parent_key =  110 kind = 'E' data_component_name = 'KEY_IND'                       screen_field_name = 'CB_OKEY'  )
      ( key =  170  parent_key =  110 kind = 'E' data_component_name = 'INTERFACE_IND'                 screen_field_name = 'CB_INTF'  )
      ( key =  180  parent_key =  110 kind = 'E' data_component_name = 'READ_IND'                      screen_field_name = 'CB_OREAD' )
      ( key =  190  parent_key =  110 kind = 'E' data_component_name = 'CREATE_IND'                    screen_field_name = 'CB_OCREA' )
      ( key =  200  parent_key =  110 kind = 'E' data_component_name = 'UPDATE_IND'                    screen_field_name = 'CB_OUPDT' )
      ( key =  210  parent_key =  110 kind = 'E' data_component_name = 'NON_CRU_IND'                   screen_field_name = 'CB_ONCRU' )

      ( key =  700 parent_key =     0 kind = 'S' data_component_name = 'NAMING'                        screen_field_name = ''         )
      ( key =  710 parent_key =   700 kind = 'E' data_component_name = 'NAMING_NAME'                   screen_field_name = 'P_ABNAMG' )

      ( key =  400 parent_key =     0 kind = 'S' data_component_name = 'TEST_PROGRAM'                  screen_field_name = ''         )
      ( key =  410 parent_key =   400 kind = 'E' data_component_name = 'CREATE_IND'                    screen_field_name = 'CB_TEST'  )
      ( key =  420 parent_key =   400 kind = 'E' data_component_name = 'INSTANTIATE_CALL_IND'          screen_field_name = 'CB_TINST' )
      ( key =  430 parent_key =   400 kind = 'E' data_component_name = 'READ_CALL_IND '                screen_field_name = 'CB_TREAD' )
      ( key =  440 parent_key =   400 kind = 'E' data_component_name = 'CREATE_OBJECT_CALL_IND'        screen_field_name = 'CB_TCREA' )
      ( key =  450 parent_key =   400 kind = 'E' data_component_name = 'CREATE_DATA_OUT_COMMENT_IND'   screen_field_name = 'CB_TCRDT' )
      ( key =  460 parent_key =   400 kind = 'E' data_component_name = 'UPDATE_OBJECT_CALL_IND'        screen_field_name = 'CB_TUPDT' )
      ( key =  470 parent_key =   400 kind = 'E' data_component_name = 'UPDATE_OUT_COMMENT_IND'        screen_field_name = 'CB_TUPD2' )
      ( key =  475 parent_key =   400 kind = 'E' data_component_name = 'NON_CRU_IND'                   screen_field_name = 'CB_TNCRU' )

      ( key =  480 parent_key =   400 kind = 'E' data_component_name = 'TEXT_BO_IND'                   screen_field_name = 'P_TEXTBO' )
      ( key =  490 parent_key =   400 kind = 'E' data_component_name = 'ABAP_STRUCT_DESCR_IND'         screen_field_name = 'P_STRUCD' )
      ( key =  500 parent_key =   400 kind = 'E' data_component_name = 'DEEP_STRUCT_VW_IND'            screen_field_name = 'P_STRCVW' )
      ( key =  510 parent_key =   400 kind = 'E' data_component_name = 'ALV_TREE_VW_IND'               screen_field_name = 'P_TREEVW' )
      ( key =  520 parent_key =   400 kind = 'E' data_component_name = 'DB_TRANSACTION_IND'            screen_field_name = 'P_DBTRAN' )

      ( key =  600 parent_key =     0 kind = 'S' data_component_name = 'BO_FRAME_WORK'                 screen_field_name = ''         )
      ( key =  610 parent_key =   600 kind = 'E' data_component_name = 'EXCEPTION_CLASS_IND'           screen_field_name = 'CB_EXCCL' )
      ( key =  620 parent_key =   600 kind = 'E' data_component_name = 'EXCEP_CLASS_VIEW_IND'          screen_field_name = 'CB_EXCVW' )

    ).

    me->gr_selection_screen_vw->set_data_object_ref( REF #( gs_screen_data ) ).

    me->gr_selection_screen_vw->mapping_set_component_list( lt_mapping_field_list ).

  ENDMETHOD.

  METHOD get_selection_screen_vw.

    CASE iv_dynpro_screen_no.

      WHEN '1000'.

        rr_selection_screen_vw = me->gr_selection_screen_vw.

    ENDCASE.

  ENDMETHOD.

  METHOD execute_action.

    TRY.

        CASE iv_mvc_object_name.

          WHEN gcc_sel_screen_view_name.
            "-----------------------------------------------------------------
            "Selection screen
            "-----------------------------------------------------------------

            me->gr_selection_screen_vw->execute_report_event( iv_mvc_action_name ).

            CASE iv_mvc_action_name.

              WHEN zui01_sel_scrn_action=>gcc_initialization.
                "-----------------------------------------------------------------
                ""INITIALIZATION
                "-----------------------------------------------------------------

                "Create selection screen mapping
                create_sel_screen_mapping( ).

                validate( abap_false ).

              WHEN zui01_sel_scrn_action=>gcc_selection_screen_output.
                "-----------------------------------------------------------------
                "PBO
                "-----------------------------------------------------------------

                DATA(lv_last_event_name) = get_last_event_name( ).

                IF gr_selection_screen_vw->get_view_changed_ind( ) = abap_true.

                  gr_selection_screen_vw->map_data_to_screen( ).

                ELSE.

                  "This is needed for the variant selection
                  "A variant selection screen does not pass the PAI, so if the last event is still
                  "the PBO, than we now it is the selection variant.
                  IF lv_last_event_name = zui01_sel_scrn_action=>gcc_selection_screen_output OR
                     lv_last_event_name = zui01_sel_scrn_action=>gcc_initialization.

                    gr_selection_screen_vw->map_screen_to_data( ).

                    gs_data = me->gr_selection_screen_vw->get_data( ).

                    DATA(lr_generator) =
                      zbo_abap_bapi_cls_gen_prc=>create(
                        gs_data ).

                    "Validate parameters
                    DATA(ls_corrected_parameters) = lr_generator->get_corrected_parameters( gs_data ).

                    gs_data = ls_corrected_parameters-parameters.

                    gr_selection_screen_vw->set_field_settings( ls_corrected_parameters-field_settings ).

*                    "Validate parameters
*                    DATA(ls_validate) = lr_generator->validate( ).

                  ENDIF.

                ENDIF.

                IF gr_current_gui_status_vw IS NOT INITIAL.

                  gr_current_gui_status_vw->display( ).

                ENDIF.

                gr_selection_screen_vw->pbo( ).

              WHEN zui01_sel_scrn_action=>gcc_selection_screen OR "Press enter
                   'ONLI' OR                                      "Press Execute
                   'CB_TEST_PROG'.                                "Press Test program check box

                "-----------------------------------------------------------------
                "PAI
                "-----------------------------------------------------------------

                validate( ).

              WHEN 'FC01'.
                "-----------------------------------------------------------------
                "Show business list popup
                "-----------------------------------------------------------------

                bo_list_show_popup( ).

              WHEN zui01_sel_scrn_action=>gcc_start_of_selection.
                "-----------------------------------------------------------------
                "Start of selection
                "-----------------------------------------------------------------

                IF gv_unit_test_ind = abap_true.

                  gv_unit_test_ind = abap_false.

                  unit_test_execute( ).

                ELSE.

                  generate_abap_code( ).

                ENDIF.

              WHEN 'SPOS'. "Save variant

              WHEN 'UT' OR 'FC02'. "Unittest

                sscrfields-ucomm = 'ONLI'.

                gv_unit_test_ind = abap_true.

            ENDCASE.

          WHEN gcc_text_edit_view_name.
            "-----------------------------------------------------------------
            "ABAP code text edit screen
            "-----------------------------------------------------------------

            CASE iv_mvc_action_name.

              WHEN 'BACK'.

                gr_text_edit_vw->close( ).

                CLEAR gr_current_gui_status_vw.

                gr_current_view = gr_selection_screen_vw.

                LEAVE TO SCREEN 0.

              WHEN 'EXIT: E'.

                gr_text_edit_vw->close( ).

                CLEAR gr_current_gui_status_vw.

                gr_current_view = gr_selection_screen_vw.

                sscrfields-ucomm = 'CBAC'.

              WHEN zui01_sel_scrn_action=>gcc_selection_screen_output. "PBO

                me->gr_current_gui_status_vw->display( ).

            ENDCASE.

        ENDCASE.

      CATCH zab_return_exc INTO DATA(lr_return_exc).

        DATA(ls_bapiret2) = lr_return_exc->get_bapiret2_struc( ).

        IF ls_bapiret2-field IS NOT INITIAL.

          gr_selection_screen_vw->set_cursor( CONV #( ls_bapiret2-field ) ).

        ENDIF.

        zab_return_exc_vw=>display_system_mess_as_info( lr_return_exc ).

        CLEAR sy-ucomm.
        CLEAR sscrfields-ucomm.

    ENDTRY.

  ENDMETHOD.

  METHOD get_report_event_view_vw.

    rr_selection_screen_vw = me->gr_current_view.

  ENDMETHOD.

  METHOD bo_list_show_popup.

    "Start popup screen
    DATA(lr_business_object_list_vw) = NEW zbo_business_object_list_vw( ).

    DATA(ls_business_object) =
      lr_business_object_list_vw->show_business_object_list( ).

    "If a busines object is selected
    IF ls_business_object IS INITIAL.
      RETURN.
    ENDIF.

    gs_data = gr_selection_screen_vw->get_data( ).

    gs_data-bapis-create_bapi           = ls_business_object-create_bapi.
    gs_data-bapis-read_bapi             = ls_business_object-read_bapi.
    gs_data-bapis-update_bapi           = ls_business_object-update_bapi.
    REFRESH gs_data-bapis-non_cru_bapis_rng.

    gs_data-class-module_abbrev         = ls_business_object-module_abbrev.
    gs_data-class-bo_object_name        = ls_business_object-bo_name.
    gs_data-class-abap_object_name      = ''.
    gs_data-class-main_db_table_name    = ls_business_object-main_db_table_name.
    gs_data-class-bor_object_type_name  = ls_business_object-bor_object_type_name.

    bo_list_set_dependend_fields( ).

    DATA(lr_generator) = zbo_abap_bapi_cls_gen_prc=>create(
      is_parameters = gs_data ).

    DATA(ls_corrected_parameters) = lr_generator->get_corrected_parameters( gs_data ).

    gs_data = ls_corrected_parameters-parameters.

    gr_selection_screen_vw->set_data(
      is_data               = gs_data
      iv_view_changed       = abap_false
      iv_controller_changed = abap_true ).

    gr_selection_screen_vw->map_data_to_screen( ).

    gr_selection_screen_vw->set_field_settings( ls_corrected_parameters-field_settings ).

  ENDMETHOD.

  METHOD bo_list_set_dependend_fields.

    IF gs_data-class-module_abbrev IS INITIAL OR
      gs_data-class-bo_object_name IS INITIAL OR
      gs_data-class-abap_object_name IS INITIAL.

      gs_data-class-key_ind = ''.
      gs_data-test_program-instantiate_call_ind = ''.

    ELSE.

      gs_data-class-key_ind = 'X'.
      gs_data-test_program-instantiate_call_ind = 'X'.

    ENDIF.

    "cb_ocrea
    "cb_tcrea
    IF gs_data-bapis-create_bapi IS INITIAL.

      gs_data-class-create_ind = ''.
      gs_data-test_program-create_object_call_ind = ''.
      gs_data-test_program-create_data_out_comment_ind = ''.

    ELSE.

      gs_data-class-key_ind = 'X'.
      gs_data-class-create_ind = 'X'.

      gs_data-test_program-instantiate_call_ind = 'X'.
      gs_data-test_program-create_object_call_ind = 'X'.
      gs_data-test_program-create_data_out_comment_ind = 'X'.

    ENDIF.


    IF gs_data-bapis-read_bapi IS INITIAL.

      gs_data-class-read_ind = ''.
      gs_data-test_program-read_call_ind = ''.

    ELSE.

      gs_data-class-key_ind = 'X'.
      gs_data-class-read_ind = 'X'.

      gs_data-test_program-instantiate_call_ind = 'X'.
      gs_data-test_program-read_call_ind = 'X'.

    ENDIF.

    IF gs_data-bapis-update_bapi IS INITIAL.

      gs_data-class-update_ind = ''.
      gs_data-test_program-update_object_call_ind = ''.
      gs_data-test_program-update_out_comment_ind = ''.

    ELSE.

      gs_data-class-key_ind = 'X'.
      gs_data-class-update_ind = 'X'.

      gs_data-test_program-instantiate_call_ind = 'X'.
      gs_data-test_program-update_object_call_ind = 'X'.
      gs_data-test_program-update_out_comment_ind = 'X'.

    ENDIF.

  ENDMETHOD.

  METHOD generate_abap_code.

    "Generate ABAP code
    gs_data = me->gr_selection_screen_vw->get_data( ).

    DATA(lr_generator) =
      zbo_abap_bapi_cls_gen_prc=>create(
        gs_data ).

    DATA(lv_abap_code_text) = lr_generator->start( ).

    gr_current_gui_status_vw =
      NEW zui01_sel_scrn_gui_status_vw(
        iv_object_name        = 'TEXT_EDITOR_GUI_STATUS'
        iv_program_name       = 'SAPLAQRUNT'
        iv_gui_status_name    = '0500'
*        iv_gui_status_name    = 'TEXT_EDITOR'
*        it_excluded_function_codes = VALUE #(
*          ( 'ABORT' )
*          ( 'CANCEL' )
*          ( 'PRINT' )
*          ( 'FIND' )
*        )
      ).

*    gr_current_gui_status_vw =
*      NEW zui01_sel_scrn_gui_status_vw(
*        iv_object_name        = 'TEXT_EDITOR_GUI_STATUS'
*        iv_program_name       = 'SAPLAQRUNT'
*        iv_gui_status_name    = '0500'
*        it_excluded_function_codes = VALUE #(
*          ( 'ABORT' )
*          ( 'CANCEL' )
*          ( 'PRINT' )
*          ( 'FIND' )
*        )
*      ).

    "Create, show and close Text edit
    gr_text_edit_vw = zui01_text_edit_vw=>create_in_default_container(
      iv_mvc_object_name = gcc_text_edit_view_name ).

    SET HANDLER on_action
      FOR gr_text_edit_vw.

    gr_current_view = gr_text_edit_vw.

    gr_text_edit_vw->set_data_2(
      VALUE #(
        text = lv_abap_code_text ) ).

    gr_text_edit_vw->show(
      iv_focus_ind = abap_true ).

*    gr_text_edit_vw->close( ).

    CLEAR gr_text_edit_vw.

  ENDMETHOD.

  METHOD unit_test_execute.

    gr_unit_test_list_vw = NEW #( 'UNIT_TEST' ).

    me->gr_current_view = gr_unit_test_list_vw.

    DATA(lr_unit_test) = NEW zbo_abap_bapi_cls_unit_test( ).

    lr_unit_test->execute( ).

  ENDMETHOD.

  METHOD validate.

    me->gr_selection_screen_vw->map_screen_to_data( ).

    "Get selection screen data
    DATA(ls_new_data) = me->gr_selection_screen_vw->get_data( ).

    DATA(lr_generator) =
      zbo_abap_bapi_cls_gen_prc=>create(
        gs_data ).

    "Get default parameters
    DATA(ls_corrected_parameters) = lr_generator->get_corrected_parameters( ls_new_data ).

    gs_data = ls_corrected_parameters-parameters.

    "Set selection screen data
    gr_selection_screen_vw->set_data(
      is_data               = gs_data
      iv_view_changed       = abap_false
      iv_controller_changed = abap_true ).

    gr_selection_screen_vw->map_data_to_screen( ).

    gr_selection_screen_vw->set_field_settings( ls_corrected_parameters-field_settings ).

    "Validate
    DATA(ls_validate) = lr_generator->validate( ).

    "Create exception
    DATA(lx_return) = zab_return_exc=>create_by_bapiret2_table( ls_validate-return_tab ).

    IF iv_raise_exception_ind = abap_true.

      IF lx_return IS NOT INITIAL.

        DATA(ls_return) = lx_return->get_bapiret2_struc( ).

        IF ls_return-field IS NOT INITIAL.

          gr_selection_screen_vw->set_cursor( CONV #( ls_return-field ) ).

        ENDIF.

        RAISE EXCEPTION lx_return.

      ENDIF.

    ENDIF.

  ENDMETHOD.

ENDCLASS.

*------------------------------------------------------------------------------*
* Application
*------------------------------------------------------------------------------*

DATA:
gr_main_controller TYPE REF TO zbo_abap_bapi_cls_gen_main_ctl.

LOAD-OF-PROGRAM.

  gr_main_controller = NEW #( 'MAIN_CONTROLLER' ).

  gr_main_controller->execute_report_event(
    zui01_sel_scrn_action=>gcc_load_of_program ).

*------------------------------------------------------------------------------*
* INITIALIZATION.
*------------------------------------------------------------------------------*
INITIALIZATION.

  "------------------------------------------------------------------------------*
  "Set title
  DATA(lv_version) = |v1.2|.
  sy-title = |ABAP BAPI BO Class generator { lv_version }|.

  "------------------------------------------------------------------------------*
  "Set selection screen texts

  class2_t = 'Methods'.
  test2_t  = 'Method calls'.
  test3_t  = 'Test framework classes'.

  "Button texts
  sscrfields-functxt_01 = 'Select business object'.
  sscrfields-functxt_02 = 'Unit test'.

  "Frame titles
  tx_bapi  = 'BAPIs'(011).
  tx_class = 'Business object class'(010).
  tx_test  = 'Test program'(012).
  tx_frmw  = 'Business Object framework'.

  "****************************************************************************

  "This way of setting texts was choosen so that the text elements
  "do not have to be filled. So all text can stay in the source code.

  "p_bread  Read (get detail) BAPI
  %_p_bread_%_app_%-text  = 'Read BAPI (get_detail) '.
  %_p_bcreat_%_app_%-text = 'Create BAPI'.
  %_p_bupdt_%_app_%-text  = 'Update BAPI (change)'.
  %_s_b_actn_%_app_%-text = 'Non-CRU BAPIs'.

  "ABAP Business Object framework
  %_p_modnm_%_app_%-text  = 'Module name abbreviation'.
  %_p_objnm_%_app_%-text  = 'Business object name'.
  %_p_abpnm_%_app_%-text  = 'ABAP object name'.
  %_p_tabnm_%_app_%-text  = 'BO main DB table'.
  %_p_bornm_%_app_%-text  = 'BOR Object type'.
  %_cb_okey_%_app_%-text  = 'Get key and instance method'.
  %_cb_intf_%_app_%-text  = 'Generate class interface'.
  %_cb_oread_%_app_%-text = 'Read method (Get detail BAPI)'.
  %_cb_ocrea_%_app_%-text = 'Create method'.
  %_cb_oupdt_%_app_%-text = 'Update method'.
  %_cb_oncru_%_app_%-text = 'Non-CRU methods'.

  "Test code
  %_cb_test_%_app_%-text  = 'Create test program'.
  %_cb_tinst_%_app_%-text = 'Instantiate call'.
  %_cb_tread_%_app_%-text = 'Get data call'.
  %_cb_tcrea_%_app_%-text = 'Create object call'.
  %_cb_tcrdt_%_app_%-text = '- Out comment data'.
  %_cb_tupdt_%_app_%-text = 'Update object call'.
  %_cb_tupd2_%_app_%-text = '- Out comment data'.
  %_cb_tncru_%_app_%-text = 'Non-CRU method calls'.

  %_p_textbo_%_app_%-text = 'Text BO class'.
  %_p_strucd_%_app_%-text = 'ABAP Structure descr. class'.
  %_p_strcvw_%_app_%-text = 'Deep structure view class'.
  %_p_treevw_%_app_%-text = 'ALV tree view class'.
  %_p_dbtran_%_app_%-text = 'Database transaction class'.

  "ABAP Business Object framework
  %_cb_exccl_%_app_%-text = 'Except. class ZBA_RETURN_EXC'.
  %_cb_excvw_%_app_%-text = 'Exc view ZBA_RETURN_EXC_VW'.

  "ABAP Naming
  %_p_abnamg_%_app_%-text = 'ABAP Naming'.

  "------------------------------------------------------------------------------*
  "Execute action INITIALIZATION.

  gr_main_controller->execute_report_event(
    zui01_sel_scrn_action=>gcc_initialization ).

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_bcreat.

  DATA: field LIKE dynpread-fieldname.
  field = 'P_BCREAT'.
  CALL FUNCTION 'RS_HELP_HANDLING'
    EXPORTING
      dynpfield                 = field
      dynpname                  = sy-dynnr
      object                    = 'FB'
      progname                  = 'SAPLSFUNCTION_BUILDER'
      suppress_selection_screen = 'X'.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_bread.

  DATA: field LIKE dynpread-fieldname.
  field = 'P_BREAD'.
  CALL FUNCTION 'RS_HELP_HANDLING'
    EXPORTING
      dynpfield                 = field
      dynpname                  = sy-dynnr
      object                    = 'FB'
      progname                  = 'SAPLSFUNCTION_BUILDER'
      suppress_selection_screen = 'X'.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_bupdt.

  DATA: field LIKE dynpread-fieldname.
  field = 'P_BUPDT'.
  CALL FUNCTION 'RS_HELP_HANDLING'
    EXPORTING
      dynpfield                 = field
      dynpname                  = sy-dynnr
      object                    = 'FB'
      progname                  = 'SAPLSFUNCTION_BUILDER'
      suppress_selection_screen = 'X'.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR s_b_actn-low.

  DATA: field LIKE dynpread-fieldname.
  field = 'S_B_ACTN-LOW'.
  CALL FUNCTION 'RS_HELP_HANDLING'
    EXPORTING
      dynpfield                 = field
      dynpname                  = sy-dynnr
      object                    = 'FB'
      progname                  = 'SAPLSFUNCTION_BUILDER'
      suppress_selection_screen = 'X'.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_bornm.

  CALL FUNCTION 'RS_HELP_HANDLING'
    EXPORTING
      dynpfield                 = 'P_BORNM'
      dynpname                  = sy-dynnr
      object                    = 'SOBJ'
      progname                  = 'SAPLSWOO'
      suppress_selection_screen = 'X'
      variant                   = 'SAP&STANDARD'
    EXCEPTIONS
      OTHERS                    = 0.

*------------------------------------------------------------------------------*
* AT SELECTION-SCREEN OUTPUT. = PBO
*------------------------------------------------------------------------------*
AT SELECTION-SCREEN OUTPUT.

  "Raise event
  gr_main_controller->execute_report_event( zui01_sel_scrn_action=>gcc_selection_screen_output ).

*------------------------------------------------------------------------------*
* AT SELECTION-SCREEN. = PAI
*------------------------------------------------------------------------------*
AT SELECTION-SCREEN ON EXIT-COMMAND.
  gr_main_controller->execute_report_event( zui01_sel_scrn_action=>gcc_exit_command ).

*------------------------------------------------------------------------------*
* AT SELECTION-SCREEN. = PAI
*------------------------------------------------------------------------------*
AT SELECTION-SCREEN.

  gr_main_controller->execute_report_event( zui01_sel_scrn_action=>gcc_selection_screen ).

*-----------------------------------------------------------------------------*
* Execute
*-----------------------------------------------------------------------------*
START-OF-SELECTION.

  gr_main_controller->execute_report_event( zui01_sel_scrn_action=>gcc_start_of_selection ).
