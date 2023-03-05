import axios from "axios";
import api from "@/components/store/api";

const state = {
	services: [],
	reviews: [],
	birdType: [],
	posts: [],
};

const mutations = {
	UPDATE_SERVICE_ITEM(state, payload){
		state.services = payload;
	},
	// UPDATE_REVIEW_ITEM(state, payload){
	// 	state.reviews = payload;
	// },
	// UPDATE_BIRD_TYPE_ITEM(state, payload){
	// 	state.birdType = payload;
	// },
	UPDATE_POST_ITEM(state, payload){
		state.posts = payload;
	}
};

const actions = {
	async getServiceItem({ commit }) {
		const response = await api.get("/service");
		commit("UPDATE_SERVICE_ITEM", response.data.services);
	},
	// async getReviewItem({ commit }) {
	// 	const response = await axios.get("/api/reviews");
	// 	commit("UPDATE_REVIEW_ITEM", response.data);
	// },
	// async getBirdTypeItem({ commit }) {
	// 	// need to fix path
	// 	const response = await axios.get("/api/account/birdType");
	// 	commit("UPDATE_BIRD_TYPE_ITEM", response.data);
	// },
	async getPostItem({ commit }){
		const response = await api.get("/post");
		commit("UPDATE_POST_ITEM", response.data.posts);
	}
};

const getters = {
	serviceItems: state => state.services,
	// reviewItems: state => state.reviews,
	// birdTypeItems: state => state.birdType,
	postItems: state => state.posts
};

const baseModule = {
	state,
	mutations,
	actions,
	getters
};

export default baseModule;