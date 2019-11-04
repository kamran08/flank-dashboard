<template>
	<div>
		<div class="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<!--~~~~~~~ TABLE ONE ~~~~~~~~~-->
						<div class="_1adminOverveiw_table_recent _box_shadow _border_radious _mar_b30 _p20">
							<div class="_overflow _table_div">
								<table class="_table">
										<!-- TABLE TITLE -->
                                    <tr> 
                                        <th >Column</th>
                                        <th>Value</th>
                                    </tr>
                                    <tr>
                                        <td>ID</td>
                                        <td>{{user.id}}</td>
                                    </tr>
                                    <tr>
                                        <td>Name</td>
                                        <td v-if="isEdit" ><Input type="text"  v-model="edit_data.name" /></td>
                                        <td v-else >{{user.name}}</td>
                                    </tr>
                                    <tr>
                                        <td>Sport</td>
                                        <td v-if="isEdit" ><Input type="text"  v-model="edit_data.sport" /></td>
                                        <td v-else >{{user.sport}}</td>
                                    </tr>
                                    <tr>
                                        <td>city</td>
                                        <td v-if="isEdit" ><Input type="text"  v-model="edit_data.city" /></td>
                                        <td v-else >{{user.city}}</td>
                                    </tr>
                                    <tr>
                                        <td>State</td>
                                        <td v-if="isEdit" ><Input type="text"  v-model="edit_data.state" /></td>
                                        <td v-else >{{user.state}}</td>
                                    </tr>
                                    <tr>
                                        <td>Division</td>
                                        <td v-if="isEdit" ><Input type="text"  v-model="edit_data.division" /></td>
                                        <td v-else >{{user.division}}</td>
                                    </tr>
                                    <tr>
                                        <td>Phone</td>
                                        <td v-if="isEdit" ><Input type="text"  v-model="edit_data.phone" /></td>
                                        <td v-else >{{user.phone}}</td>
                                    </tr>
                                    <tr>
                                        <td>About</td>
                                        <td v-if="isEdit" ><Input type="textarea" :autosize="{minRows: 2,maxRows: 5}"   v-model="edit_data.about" /></td>
                                        <td v-else >{{user.about}}</td>
                                    </tr>
                                    <tr>
                                        <td>Action</td>
                                        <td v-if="isEdit" >
                                            <button @click="updateItem" class="_btn _action_btn edit_btn1" type="button">Save</button>
                                            <button @click="editItem" class="_btn _action_btn edit_btn1" type="button">Cancel</button>
                                        </td>
                                        <td v-else ><button @click="editItem" class="_btn _action_btn edit_btn1" type="button">Edit</button></td>
                                    </tr>
                                    
                                    
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</template>

<script>

export default {
    data(){
		return{
			user:[],
			isLoading:true,
            isEdit: false,
            edit_data: {},
			editIndex:-1,
		}
	},
    methods:{
        editItem(){
			this.edit_data =  _.cloneDeep(this.user)
			this.isEdit = true
		},
        async updateItem(){

           	if (this.edit_data.name=='')return  this.e(' name can not be empty!')
            if (this.edit_data.sport=='') return this.e(' sport can not be empty!!')
            if (this.edit_data.city =='')  return this.e(' city can not be empty!!')
            if (this.edit_data.state =='')  return this.e(' state can not be empty!!')
            if (this.edit_data.divition =='')  return this.e(' divition can not be empty!!')

            const response = await this.callApi('put', '/app/user', this.edit_data);
            if (response.status === 200) {
                this.user  =  _.cloneDeep(this.edit_data)
                
             	
				this.isEdit = false
                this.s('Information updated successfully !');
            }else{
                this.swr();
            }
        },
        editProduct(pro,index){
            this.modal1 = true
        },
	},
	async created(){
		const res = await this.callApi('get','/app/user')
		if( res.status == 200){
           
			this.user = res.data
			
		} else {
			this.swr()
			this.isLoading = false
		}
	},




}
</script>
<style scoped>
.demo-upload-list { 
  display: inline-block;
  width: 200px;
  height: 150px;
  text-align: center;
  line-height: 60px;
  border: 1px solid transparent;
  border-radius: 4px;
  overflow: hidden;

  position: relative;

  margin-right: 4px;
}
.demo-upload-list img {
  width: 100%;
  height: 100%;
}
.demo-upload-list-cover {
  display: none;
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.6);
}
.demo-upload-list:hover .demo-upload-list-cover {
  display: block;
}
.demo-upload-list-cover i {
  color: #fff;
  font-size: 40px;
  cursor: pointer;
  margin: 0 2px;
}
</style>


