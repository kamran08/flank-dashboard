<template>
	<div>
		<div class="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="_1adminOverveiw_table_recent row">
                                    <div class="con-md-8">
                                        <Input v-model="form_data.info" placeholder="Enter Name..." style="width: 320px; padding:5px;"  />
                                        <Select v-model="form_data.isAvailable" style="width: 220px; padding:5px;" >
                                            <Option  value="Yes" >Yes</Option>
                                            <Option  value="No" >No</Option>
                                        </Select>
                                    </div>
                                    <div class="con-md-4">
                                        <button @click="addItem" class="_btn _action_btn view_btn1 category_button" type="button" style="width: 210px; padding:5px; margin-left: 5px;" >Add</button>
                                    </div>
                                </div>
                            </div>
                        </div>
						<!--~~~~~~~ TABLE ONE ~~~~~~~~~-->
                        <div class="_1adminOverveiw_table_recent _box_shadow _border_radious _mar_b30 _p20">
                            <div class="_overflow _table_div">
                                <table class="_table">
                                    <tr>
                                        <th>Num</th>
                                        <th>Details</th>
                                        <th>Is Available</th>
                                        <th>Action</th>
                                    </tr>
                                        <!-- ITEMS -->
                                    <tr v-for="(item,index) in data " :key="index" >
                                        <template  v-if="isEdit && editIndex == index">
                                            <td>{{index+1}}</td>
                                            <td><Input v-model="form_data.info" placeholder="Enter Name..." style="width: 320px; padding:5px;"  /></td>
                                            <td>
                                                <Select v-model="form_data.isAvailable" style="width: 220px; padding:5px;" >
                                                    <Option  value="Yes" >Yes</Option>
                                                    <Option  value="No" >No</Option>
                                                </Select>
                                            </td>
                                             <td>
                                                <span class="_pointer"  @click="updateItem" ><i class="fas fa-save"></i></span>
                                                <span class="_pointer_red"  @click="cencelEdit" ><i class="fas fa-window-close"></i></span>
                                            </td>
                                        </template>
                                        <template v-else>
                                            <td>{{index+1}}</td>
                                            <td>{{item.info}}</td>
                                            <td>{{item.isAvailable}}</td>
                                            <td>
                                                <span class="_pointer" @click="editItem(item,index)" ><i class="fas fa-edit"></i></span>
                                                <span class="_pointer_red" @click="deleteItem(index)" ><i class="fas fa-trash-alt"></i></span>
                                            </td>
                                        </template>
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
		    data:[],
			isLoading:true,
            item_name:'',
            isEdit:false,
            form_data: {
                id:'',
                info:'',
                isAvailable:'',
            },
            editIndex:''
			
		}
	},
    methods:{
         async deleteItem(index){
            // console.log(id)
            if(!confirm("WARNING!!! Are you sure to delete this info?")){
                return;
            }
            let ob = {
                id:this.data[index].id
            }

            const response = await this.callApi('delete', '/app/bussniess',ob)
            if (response.status === 200) {
                this.data.splice(index,1)
                this.s('Item deleted');

            }else{
                console.log(response);
                this.swr()
            }
        },

        editItem(item,index){
            if(!confirm("WARNING!!! Are you sure to edit this info?")){
                return;
            }
            this.form_data = _.clone(item);
            this.editIndex = index
            this.isEdit = true;
        },

        cencelEdit(){
            this.form_data.id = '';
            this.form_data.name = '';
            this.isEdit = false;
            this.editIndex = -1;
        },

        async addItem(){
            if (this.form_data.info=='' || this.form_data.isAvailable == '') {
               return this.e('All field are required!')
            }

            const response = await this.callApi('post', '/app/bussniess', this.form_data)
            if (response.status === 200) {
                
                this.data.push(response.data)
                this.s('Item added');
                let form_data= {
                        id:'',
                        info:'',
                        isAvailable:'',
                }
                this.form_data = form_data
            }else{
                this.swr()
            }
        },

        async updateItem(){

            if (this.form_data.name=='') {
                return  this.e('Name is required')
            }
            const response = await this.callApi('put', '/app/bussniess', this.form_data);
            if (response.status === 200) {
                this.data[this.editIndex].info=this.form_data.info
                this.data[this.editIndex].isAvailable=this.form_data.isAvailable
                let form_data= {
                    id:'',
                    info:'',
                    isAvailable:'',
                }
                this.form_data = form_data
                this.editIndex = -1
                this.isEdit = false
                this.s('Item updated successfully !');
            }else{
                this.swr();
            }
        },
    },
    
    async created(){
        const res = await this.callApi('get','/app/bussniess')
		if( res.status == 200){
			this.data = res.data
		} else {
			this.swr()
		}
		this.isLoading = false
	},
}
</script>



