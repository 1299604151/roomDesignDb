import request from '@/utils/request'

// 查询色彩列表
export function listDsgnColors(query) {
  return request({
    url: '/dsgn/dsgnColors/list',
    method: 'get',
    params: query
  })
}

// 查询色彩详细
export function getDsgnColors(id) {
  return request({
    url: '/dsgn/dsgnColors/' + id,
    method: 'get'
  })
}

// 新增色彩
export function addDsgnColors(data) {
  return request({
    url: '/dsgn/dsgnColors',
    method: 'post',
    data: data
  })
}

// 修改色彩
export function updateDsgnColors(data) {
  return request({
    url: '/dsgn/dsgnColors',
    method: 'put',
    data: data
  })
}

// 删除色彩
export function delDsgnColors(id) {
  return request({
    url: '/dsgn/dsgnColors/' + id,
    method: 'delete'
  })
}
