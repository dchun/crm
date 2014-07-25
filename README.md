<div class="span9">
  <div id="import">
    <h2>Import</h2>
    <p>For best results, add records in the following order</p>

    <ol>
      <li>Districts</li>
      <li>Schools</li>
      <li>Equivalent Terms</li>
      <li>Neglected Terms</li>
      <li>Acceptable Contact Salutations</li>
      <li>Acceptable Contact Positions</li>
      <li>Acceptable Contact Roles</li>
      <li>Contacts</li>
    </ol>

    <div id="import-contacts">
      <h3>Contact Import</h3>

      <p>A CSV or Excel file can be used to import records. The first row should be the column name. The following columns are allowed.</p>

      <ul>
        <li><strong>id</strong> - Integer type: <code>first check - if id present? Update else new Contact</code></li>
        <li><strong>fname</strong><span class="required"></span> - String type</li>
        <li><strong>lname</strong> - String type</li>
        <li><strong>email</strong><span class="required"></span> - String type: <code>second check - if email present? Update else new Contact</code></li>
        <li><strong>salutation</strong><span class="required"></span> - String type: <code>must be in AcceptableContactSalutations list</code></li>
        <li><strong>position</strong><span class="required"></span> - String type: <code>must be in AcceptableContactPositions list</code></li>
        <li><strong>role</strong><span class="required"></span> - String type: <code>must be in AcceptableContactRoles list</code></li>
        <li><strong>school_name</strong></span> - String type: <code>see matching below</code></li>
        <li><strong>created_at</strong> - Datetime type</li>
        <li><strong>updated_at</strong> - Datetime type</li>
        <li><strong>reference_url</strong> - String type</li>
        <li><strong>updated_by</strong> - String type</li>
      </ul>

      <h4>Required Items</h4>
      <p>Items starred with a red asterisk <span class="required"></span> are required</p>

      <h4>Order of School Name Matching</h4>
      <ol>
        <li>find by <code>school_name</code> downcased in <code>School.name</code> downcased</li>
        <li>find by <code>school_name</code> downcased in <code>School.name</code> replaced by all terms in <code>EquivalentTerms</code> downcased list</li>
        <li>find by <code>school_name</code> downcased in <code>School.name</code> and remove all terms in <code>NeglectedTerms</code> downcased list</li>
        <li>find by <code>school_name</code> downcased in <code>School.name</code> replaced by all terms in <code>EquivalentTerms</code> downcased list and remove all terms in <code>NeglectedTerms</code> downcased list</li>
        <li>else create <code>temp_school_name</code></li>
      </ol>

    </div>

    <hr>
    
    <div id="import-schools">
      <h3>School Import</h3>

      <p>A CSV or Excel file can be used to import records. The first row should be the column name. The following columns are allowed.</p>

      <ul>
        <li><strong>id</strong> - Integer type: <code>first check - if id present? update else new School</code></li>
        <li><strong>name</strong><span class="required"></span> - String type: <code>second check - if name present? update else new School</code></li>
        <li><strong>district_name</strong><span class="required"></span>  - String type: <code>if district_name exists? add district_id else new District</code></li>
        <li><strong>state_rank</strong> - Integer type: <code>converts strings that being with "#" to integer</code></li>
        <li><strong>national_rank</strong> - Integer type: <code>converts strings that being with "#" to integer</code></li>
        <li><strong>college_readiness_score</strong> - Float type: <code>converts strings from allowed list to float</code></li>
        <li><strong>tested_ap_ib</strong> - Float type: <code>converts strings from allowed list to float</code></li>
        <li><strong>pass_ap_ib</strong> - Float type: <code>converts strings from allowed list to float</code></li>
        <li><strong>math_score</strong> - Float type: <code>converts strings from allowed list to float</code></li>
        <li><strong>math_proficient</strong> - Float type: <code>converts strings from allowed list to float</code></li>
        <li><strong>math_not_proficient</strong> - Float type: <code>converts strings from allowed list to float</code></li>
        <li><strong>reading_score</strong> - Float type: <code>converts strings from allowed list to float</code></li>
        <li><strong>reading_proficient</strong> - Float type: <code>converts strings from allowed list to float</code></li>
        <li><strong>reading_not_proficient</strong> - Float type: <code>converts strings from allowed list to float</code></li>
        <li><strong>student_teacher_ratio</strong> - String type</li>
        <li><strong>street_address</strong> - String type</li>
        <li><strong>city</strong> - String type</li>
        <li><strong>state</strong> - String type</li>
        <li><strong>zip</strong> - String type</li>
        <li><strong>city_state_zip</strong> - String type <code>overrides city and zip fields by extracting first string before comma as city, and removing all non-numeric characters as zip from the remaining string</code></li>
        <li><strong>latitude</strong> - Float type</li>
        <li><strong>longitude</strong> - Float type</li>
        <li><strong>total_enrollment</strong> - Integer type</li>
        <li><strong>total_economically_disadvantaged</strong> - Float type</li>
        <li><strong>receives_title_i_funding</strong> - Boolean type: <code>converts "Yes", "No" to true, false</code></li>
        <li><strong>ap_student_performance_participation_rate</strong> - Float type: <code>converts strings from allowed list to float</code></li>
        <li><strong>ap_student_performance_participant_passing_rate</strong> - Float type: <code>converts strings from allowed list to float</code></li>
        <li><strong>ap_student_performance_exam_per_test_taker</strong> - Float type: <code>converts strings from allowed list to float</code></li>
        <li><strong>ap_student_performance_exam_pass_rate</strong> - Float type: <code>converts strings from allowed list to float</code></li>
        <li><strong>created_at</strong> - Datetime type</li>
        <li><strong>updated_at</strong> - Datetime type</li>
      </ul>

      <h4>Required Items</h4>
      <p>Items starred with a red asterisk <span class="required"></span> are required</p>

      <h4>Allowed List</h4>
      <ul>
        <li>"N/A" converts into <code>10000</code></li>
        <li>"Does" converts into <code>10001</code></li>
        <li>"Achieves" converts into <code>10002</code></li>
        <li>"Unranked" converts into <code>10003</code></li>
      </ul>

    </div>

    <hr>
    
    <div id="import-districts">
      <h3>District Import</h3>

      <p>A CSV or Excel file can be used to import records. The first row should be the column name. The following columns are allowed.</p>

      <ul>
        <li><strong>id</strong> - Integer type: <code>first if id present? update else new</code></li>
        <li><strong>name</strong><span class="required"></span> - String type: <code>second if name present? update else new</code></li>
        <li><strong>state</strong><span class="required"></span> - String type</li>
        <li><strong>college_readiness_score</strong> - Float type: <code>connverts strings from allowed list to float</code></li>
        <li><strong>tested_ap</strong> - Float type: <code>connverts strings from allowed list to float</code></li>
        <li><strong>passed_ap</strong> - Float type: <code>connverts strings from allowed list to float</code></li>
        <li><strong>math_score</strong> - Float type: <code>connverts strings from allowed list to float</code></li>
        <li><strong>math_proficient</strong> - Float type: <code>connverts strings from allowed list to float</code></li>
        <li><strong>math_not_proficient</strong> - Float type: <code>connverts strings from allowed list to float</code></li>
        <li><strong>reading_score</strong> - Float type: <code>connverts strings from allowed list to float</code></li>
        <li><strong>reading_proficient</strong> - Float type: <code>connverts strings from allowed list to float</code></li>
        <li><strong>reading_not_proficient</strong> - Float type: <code>connverts strings from allowed list to float</code></li>
        <li><strong>created_at</strong> - Datetime type</li>
        <li><strong>updated_at</strong> - Datetime type</li>
      </ul>

      <h4>Required Items</h4>
      <p>Items starred with a red asterisk <span class="required"></span> are required</p>

      <h4>Allowed List</h4>
      <ul>
        <li>"N/A" converts into <code>10000</code></li>
        <li>"Does" converts into <code>10001</code></li>
        <li>"Achieves" converts into <code>10002</code></li>
      </ul>
    </div>
  </div>
  <hr>
  <div id="export">
    <h2>Export</h2>
    <p>The export function is not handled in a separate controller.</p>
    <div id="export-contacts">
      <h3>Contacts</h3>
      <p>Currently all fields are exported according to the results of the filters with a limit of 25 fields.</p>
    </div>  
    <hr>      
    <div id="export-schools">
      <h3>Schools</h3>
      <p>Currently all fields are exported according to the results of the filters with a limit of 25 fields.</p>
    </div> 
    <hr>       
    <div id="export-districts">
      <h3>Districts</h3>
      <p>Currently all fields are exported according to the results of the filters with a limit of 25 fields.</p>
    </div>
  </div>
  <hr>
  <div id="user">
    <h2>Users</h2>
    <p>Master User is created upon migration of the database with master@example.com</p>
    <div id="user-master">
      <h3>Master</h3>
      <p>Master has access to all actions from the following resources:</p>
      <pre>
        :users
        :contacts
        :contact_imports
        :schools
        :school_imports
        :districts
        :district_imports
        :acceptable_contact_roles
        :acceptable_contact_positions
        :acceptable_contact_salutations
      </pre>
    </div>
    <hr>
    <div id="user-contact-editing">
      <h3>Contact Editing</h3>
      <p>Contact Editing has access to the following actions from the following resources:</p>
      <pre>
        :contacts
        index -> only list of incomplete records where at least one field is missing with a limit of 10
        show -> only contacts that have incomplete records
        update -> only fields that are blank
      </pre>
    </div>
    <hr>
    <div id="user-data-entry">
      <h3>Data Entry</h3>
      <p>Data Entry has access to the following actions from the following resources:</p>
      <pre>
        :contacts
        create -> will not be able to view created items, unless ownership relations are made
      </pre>
    </div>
  </div>
  <hr>
  <div id="filter">
    <h2>Filter</h2>
    <p>Filters consist of selects for exact matches, search fields for %like% matches, and greater than or equal to and/or less than or equal to for numeric fields.</p>
    <div id="filter-contacts">
      <h3>Contact</h3>
      <p>The following list shows the types of filters:
        <pre>
          :fname -> contains
          :lname -> contains
          :email -> contains
          :salutation -> equals list from AcceptableContactSalutation model
          :position -> equals list from AcceptableContactPosition model
          :role -> equals list from AcceptableContactRole model
          :school_id -> equals list from School model
          :school_district_id -> equals list from District model through School model
          :reference_url -> contains
          :updated_by -> contains
        </pre>
      </div>  
      <hr>      
      <div id="filter-schools">
        <h3>School</h3>
        <p>The following list shows the types of filters:
          <p><span class="label label-warning">The :student_teacher_ratio field is a string field and only allows contains filters.</span></p>
          <pre>
            :state -> equals list of states created in helper method
            :district_name -> equals list from District model
            :name -> contains
            :state_rank -> greater than or equal to and/or less than or equal to
            :national_rank -> greater than or equal to and/or less than or equal to
            :college_readiness_score -> greater than or equal to and/or less than or equal to
            :tested_ap_ib ->mgreater than or equal to and/or less than or equal to
            :pass_ap_ib -> greater than or equal to and/or less than or equal to
            :math_score -> greater than or equal to and/or less than or equal to
            :math_proficient -> greater than or equal to and/or less than or equal to
            :math_not_proficient -> greater than or equal to and/or less than or equal to
            :reading_score -> greater than or equal to and/or less than or equal to
            :reading_proficient -> greater than or equal to and/or less than or equal to
            :reading_not_proficient -> greater than or equal to and/or less than or equal to
            :student_teacher_ratio -> contains
            :total_enrollment -> greater than or equal to and/or less than or equal to
            :total_economically_disadvantaged -> greater than or equal to and/or less than or equal to
            :receives_title_i_funding -> true or false
            :ap_student_performance_participation_rate -> greater than or equal to and/or less than or equal to
            :ap_student_performance_participant_passing_rate -> greater than or equal to and/or less than or equal to
            :ap_student_performance_exam_per_test_taker -> greater than or equal to and/or less than or equal to
            :ap_student_performance_exam_pass_rate -> greater than or equal to and/or less than or equal to
          </pre>
        </div>  
        <hr>      
        <div id="filter-districts">
          <h3>Districts</h3>
          <p>The following list shows the types of filters:
            <pre>
              :state -> equals list of states created in helper method
              :name -> contains
              :college_readiness_score -> greater than or equal to and/or less than or equal to
              :tested_ap -> greater than or equal to and/or less than or equal to
              :passed_ap -> greater than or equal to and/or less than or equal to
              :math_score -> greater than or equal to and/or less than or equal to
              :math_proficient -> greater than or equal to and/or less than or equal to
              :math_not_proficient -> greater than or equal to and/or less than or equal to
              :reading_score -> greater than or equal to and/or less than or equal to
              :reading_proficient -> greater than or equal to and/or less than or equal to
              :reading_not_proficient -> greater than or equal to and/or less than or equal to
            </pre>
          </div>
        </div>
      </div>