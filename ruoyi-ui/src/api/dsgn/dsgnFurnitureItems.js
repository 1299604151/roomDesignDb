import request from '@/utils/request'

// 查询家具素材列表
export function listDsgnFurnitureItems(query) {
  return request({
    url: '/dsgn/dsgnFurnitureItems/list',
    method: 'get',
    params: query
  })
}

// 查询家具素材详细
export function getDsgnFurnitureItems(id) {
  return request({
    url: '/dsgn/dsgnFurnitureItems/' + id,
    method: 'get'
  })
}

// 新增家具素材
export function addDsgnFurnitureItems(data) {
  return request({
    url: '/dsgn/dsgnFurnitureItems',
    method: 'post',
    data: data
  })
}

// 修改家具素材
export function updateDsgnFurnitureItems(data) {
  return request({
    url: '/dsgn/dsgnFurnitureItems',
    method: 'put',
    data: data
  })
}

// 删除家具素材
export function delDsgnFurnitureItems(id) {
  return request({
    url: '/dsgn/dsgnFurnitureItems/' + id,
    method: 'delete'
  })
}
