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
                                    <tr>
                                        <th>Num</th>
                                        <th>Name</th>
                                        <th>Contact</th>
                                        <th>Date</th>
                                        <th>Action</th>
                                    </tr>
                                        <!-- ITEMS -->
                                    <tr v-for="(item,index) in data " :key="index" >
                                        
                                        <template >
                                            <td>{{index+1}}</td>
                                            <td>{{item.name}}</td>
                                            <td>{{item.contact}}</td>
                                            <td>{{item.date}}</td>
                                            <td>
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

            const response = await this.callApi('delete', '/app/schedules',ob)
            if (response.status === 200) {
                this.data.splice(index,1)
                this.s('Item deleted');

            }else{
                console.log(response);
                this.swr()
            }
        },

        
    },
    
    async created(){
        const res = await this.callApi('get','/app/schedules')
		if( res.status == 200){
			this.data = res.data
		} else {
			this.swr()
		}
		this.isLoading = false
	},
}
</script>



